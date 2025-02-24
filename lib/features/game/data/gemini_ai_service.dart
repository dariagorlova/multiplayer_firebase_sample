import 'dart:convert';

import 'package:google_gemini_ai/google_gemini_ai.dart';
import 'package:multiplayer_firebase_sample/core/constants/ai_key.dart';

import '../../../core/index.dart';
import '../index.dart';

class GeminiAiService implements AiService {
  final LoggerService _loggerService;
  late final GoogleGemini _gemini;

  GeminiAiService(LoggerService loggerService) : _loggerService = loggerService {
    _gemini = GoogleGemini(apiKey: gemini_key);
  }

  Future<String?> getDataFromAI({required String word}) async {
    try {
      const language = 'English';
      final prompt = '''
        You are linguist with 15 years of experience in $language language. 
        Check if this word: ${word.toLowerCase()} exist and correctly written in $language language? 
        
        Return as JSON format with structure:
        {
          "word": word, that you checked,
          "exist": true if correctly written in $language language, else: false,
          "reason": if "exists" false, explain why here. otherwise, skip this field,
          "noun": true if word is noun, false if not,
          "name": true if word is a name of a person, place, or brand, and there is no commonly used word with same meaning, false if not
        }      
        ''';

      final response = await _gemini.generateFromText(prompt);
      final jsonAsText = _analyze(response.text);

      if (jsonAsText != null) {
        final responseModel = AiModel.fromJson(jsonDecode(jsonAsText) as Map<String, dynamic>);

        if (!responseModel.exists) {
          return responseModel.reason ?? GameExceptionKeys.unknownError;
        }

        if (!responseModel.noun) {
          return GameExceptionKeys.wordDoesNotNoun;
        }

        if (responseModel.name) {
          return GameExceptionKeys.wordIsName;
        }

        // the word exists, is a noun, and is not a name.
        return null;
      }
      return GameExceptionKeys.unknownError;
    } catch (e, stack) {
      _loggerService.error(e.toString(), stack);
      // here we got an gemini exception. we don't know if the word is correct. but that's not a problem for user, so, the word is correct for him))
      return null;
    }
  }

  String? _analyze(String? response) {
    final data = response?.replaceAll('\n', '');
    if (data != null) {
      final start = data.indexOf('{');
      final end = data.indexOf('}') + 1;
      if (start != -1 && end != -1 && start < end) {
        return data.substring(start, end);
      }
    }
    return null;
  }
}

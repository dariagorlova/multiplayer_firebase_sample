import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/index.dart';

part 'countdown_state.dart';
part 'countdown_cubit.freezed.dart';

class CountdownCubit extends Cubit<CountdownState> {
  Timer? _timer;
  final LoggerService _logger;
  CountdownCubit(LoggerService logger)
      : _logger = logger,
        super(CountdownState.initial()) {
    _logger.simple('CountdownCubit is created');
  }

  void init(int maxSeconds) {
    emit(state.copyWith(secondsPerPlayerMove: maxSeconds, time: Duration(seconds: maxSeconds)));
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final newDuration = state.time - const Duration(seconds: 1);
      if (newDuration.inSeconds > 0) {
        emit(state.copyWith(time: newDuration, status: CountdownStatus.counting));
      } else {
        _timer?.cancel();
        emit(state.copyWith(time: const Duration(seconds: 0), status: CountdownStatus.done));
      }
    });
  }

  String get asTimeString =>
      '${state.time.inMinutes.remainder(60).toString().padLeft(2, '0')}:${state.time.inSeconds.remainder(60).toString().padLeft(2, '0')}';

  void stop() {
    _logger.simple('CountdownCubit is stoped');
    _timer?.cancel();
    emit(state.copyWith(status: CountdownStatus.stop, time: Duration(seconds: state.secondsPerPlayerMove)));
  }

  void start() {
    _logger.simple('CountdownCubit is started');
    _timer?.cancel();
    _timer = null;
    emit(state.copyWith(time: Duration(seconds: state.secondsPerPlayerMove), status: CountdownStatus.counting));
    _startTimer();
  }

  void pause() {
    if (state.status == CountdownStatus.counting) {
      _logger.simple('CountdownCubit is paused');
      _timer?.cancel();
      emit(state.copyWith(status: CountdownStatus.pause));
    }
  }

  void resume() {
    if (state.status == CountdownStatus.pause && state.time.inSeconds > 0) {
      _logger.simple('CountdownCubit is resumed');
      emit(state.copyWith(status: CountdownStatus.counting));
      _startTimer();
    }
  }

  @override
  Future<void> close() {
    _logger.simple('CountdownCubit is destroyed');
    _timer?.cancel();
    return super.close();
  }
}

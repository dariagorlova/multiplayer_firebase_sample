import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/index.dart';
import '../../features/game_host/index.dart';
import '../../features/game/index.dart';
import '../../features/game_join/index.dart';
import '../../features/game_waiting/index.dart';
import '../../features/home/index.dart';

import '../index.dart';

part 'routes.g.dart';
part 'route/auth.dart';
part 'route/home.dart';

List<RouteBase> get routes => $appRoutes;

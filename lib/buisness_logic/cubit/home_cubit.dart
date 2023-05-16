import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/soltana_model.dart';

part 'home_state.dart';

/// {@template home_cubit}
/// This cubit responsible of managing the home screen state.
/// {@endtemplate}
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}

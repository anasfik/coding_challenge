import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TabItem extends Equatable {
  final String name;
  final Widget screen;
  const TabItem({
    required this.name,
    required this.screen,
  });

  @override
  List<Object?> get props => [name, screen];
}

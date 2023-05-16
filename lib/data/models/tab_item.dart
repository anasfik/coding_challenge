import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// {@template tab_item}
/// Represents a tab item data model that will be used in the app.
/// {@endtemplate}
class TabItem extends Equatable {
  /// The name of the tab.
  final String name;

  /// The screen that will be displayed when the tab is selected.
  final Widget screen;

  /// {@macro tab_item}
  const TabItem({
    required this.name,
    required this.screen,
  });

  @override
  List<Object?> get props => [name, screen];
}

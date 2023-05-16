import 'package:equatable/equatable.dart';

class TabItem extends Equatable {
  final String name;

  const TabItem({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}

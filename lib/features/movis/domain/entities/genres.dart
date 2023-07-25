import 'package:equatable/equatable.dart';

class Gneres extends Equatable {
  final String name;
  final int id;
  Gneres({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

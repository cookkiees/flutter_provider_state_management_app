import 'package:equatable/equatable.dart';

class ArticleSourceEntity extends Equatable {
  final String? id;
  final String? name;

  const ArticleSourceEntity({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}

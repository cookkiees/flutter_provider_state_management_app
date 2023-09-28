import 'package:equatable/equatable.dart';

class UserCompanyEntity extends Equatable {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  const UserCompanyEntity({this.name, this.catchPhrase, this.bs});

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}

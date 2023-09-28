import 'package:equatable/equatable.dart';

class UserGeoEntity extends Equatable {
  final String? lat;
  final String? lng;

  const UserGeoEntity({this.lat, this.lng});

  @override
  List<Object?> get props => [lat, lng];
}

import 'package:equatable/equatable.dart';
import 'user_geo_entity.dart';

class UserAddressEntity extends Equatable {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final UserGeoEntity? geo;

  const UserAddressEntity({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];
}

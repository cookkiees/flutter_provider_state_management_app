import '../../domain/entities/user_address_entity.dart';
import 'user_geo_models.dart';

class UserAddressModels extends UserAddressEntity {
  const UserAddressModels({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    UserGeoModels? geo,
  });

  factory UserAddressModels.fromJson(Map<String, dynamic> json) {
    return UserAddressModels(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: json['geo'] != null ? UserGeoModels.fromJson(json['geo']) : null,
    );
  }
  factory UserAddressModels.fromEntity(UserAddressEntity entity) {
    return UserAddressModels(
      street: entity.street,
      suite: entity.suite,
      city: entity.city,
      zipcode: entity.zipcode,
      geo: entity.geo != null
          ? UserGeoModels.fromEntity(entity.geo ?? const UserGeoModels())
          : null,
    );
  }
}

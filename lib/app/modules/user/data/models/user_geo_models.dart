import '../../domain/entities/user_geo_entity.dart';

class UserGeoModels extends UserGeoEntity {
  const UserGeoModels({
    String? lat,
    String? lng,
  });

  factory UserGeoModels.fromJson(Map<String, dynamic> json) {
    return UserGeoModels(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  factory UserGeoModels.fromEntity(UserGeoEntity entity) {
    return UserGeoModels(
      lat: entity.lat,
      lng: entity.lng,
    );
  }
}

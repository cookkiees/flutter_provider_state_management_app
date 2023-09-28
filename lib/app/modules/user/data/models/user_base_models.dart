import '../../domain/entities/user_base_entity.dart';
import 'user_address_models.dart';
import 'user_company_models.dart';

class UserBaseModels extends UserBaseEntity {
  const UserBaseModels({
    int? id,
    String? name,
    String? username,
    String? email,
    UserAddressModels? address,
    String? phone,
    String? website,
    UserCompanyModels? company,
  }) : super(
          id: id,
          name: name,
          username: username,
          email: email,
          address: address,
          phone: phone,
          website: website,
          company: company,
        );
  factory UserBaseModels.fromJson(Map<String, dynamic> json) {
    return UserBaseModels(
      id: json['id'] as int?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      address:
          UserAddressModels.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      company:
          UserCompanyModels.fromJson(json['company'] as Map<String, dynamic>),
    );
  }
  factory UserBaseModels.fromEntityMap(UserBaseEntity entity) {
    return UserBaseModels(
      id: entity.id,
      name: entity.name,
      username: entity.username,
      email: entity.email,
      address: entity.address != null
          ? UserAddressModels.fromEntity(entity.address!)
          : null,
      phone: entity.phone,
      website: entity.website,
      company: entity.company != null
          ? UserCompanyModels.fromEntity(entity.company!)
          : null,
    );
  }
}

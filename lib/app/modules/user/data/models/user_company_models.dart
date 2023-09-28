import '../../domain/entities/user_company_entity.dart';

class UserCompanyModels extends UserCompanyEntity {
  const UserCompanyModels({
    String? name,
    String? catchPhrase,
    String? bs,
  });

  factory UserCompanyModels.fromJson(Map<String, dynamic> json) {
    return UserCompanyModels(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
  factory UserCompanyModels.fromEntity(UserCompanyEntity entity) {
    return UserCompanyModels(
      name: entity.name,
      catchPhrase: entity.catchPhrase,
      bs: entity.bs,
    );
  }
}

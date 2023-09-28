import 'package:equatable/equatable.dart';
import 'user_address_entity.dart';
import 'user_company_entity.dart';

class UserBaseEntity extends Equatable {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final UserAddressEntity? address;
  final String? phone;
  final String? website;
  final UserCompanyEntity? company;

  const UserBaseEntity(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  @override
  List<Object?> get props =>
      [id, name, username, email, address, phone, website, company];
}

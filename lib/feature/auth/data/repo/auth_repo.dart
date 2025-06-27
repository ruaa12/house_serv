import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart';
import 'package:home_serviece/feature/auth/data/models/register_model.dart';

class AuthRepository {
  final AuthDatasource datasource;

  AuthRepository(this.datasource);

  Future<Register?> register({
    required String email,
    required String password,
    required String phone,
    required String fullname,
    required String username,
  }) async {
    
    return await datasource.register(
        email, password, phone, fullname, username);
  }
}

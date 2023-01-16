import 'package:domain/domain.dart';
import 'package:data/data.dart';

abstract class AuthRemoteDatasource {
  /// Login with email and password
  Future<AuthUserEntity> postLoginCredentials(AuthParamsEntity params);
  
  /// Register with email and password
  Future<AuthUserEntity> postRegisterCredentials(AuthParamsEntity params);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final BaseApi baseApi;

  AuthRemoteDatasourceImpl(this.baseApi);
  
  @override
  Future<AuthUserEntity> postLoginCredentials(AuthParamsEntity params) async {
    final data = await baseApi.postLogin(LOGIN, data: params.toJson());
    return AuthUserModel.fromJson(data);
  }
  
  @override
  Future<AuthUserEntity> postRegisterCredentials(AuthParamsEntity params) {
    //TODO: implement postRegisterCredentials
    throw UnimplementedError();
  }
}

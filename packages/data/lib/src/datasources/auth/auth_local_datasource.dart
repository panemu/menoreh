import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AuthLocalDatasource {
  /// chack local auth data
  Future<bool> checkLogin();

  /// save to local auth data
  Future<void> cacheLogin(AuthUserModel data);

  /// get local auth data
  Future<AuthUserEntity> getUserData();

  /// delete local auth data
  Future<bool> logout();
}

class AuthLocalDatasourceImpl extends AuthLocalDatasource {
  Future<Box> _getBox() async {
    return await Hive.openBox(BOX_LOGIN).onError((e, s) => throw CacheException(message: FAILURE_UNKNOWN));
  }

  @override
  Future<bool> checkLogin() async {
    Box box = await _getBox();

    if (box.containsKey(BOX_KEY_LOGIN)) {
      return true;
    } else {
      throw CacheException(message: EXCEPTION_LOGIN);
    }
  }

  @override
  Future<void> cacheLogin(AuthUserModel data) async {
    Box box = await _getBox();

    box.put(BOX_KEY_LOGIN, data).onError((error, stackTrace) {
      throw CacheException(message: FAILURE_UNKNOWN);
    });
  }

  @override
  Future<AuthUserEntity> getUserData() async {
    Box box = await _getBox();

    if (box.containsKey(BOX_KEY_LOGIN)) {
      return box.get(BOX_KEY_LOGIN);
    } else {
      throw CacheException(message: EXCEPTION_LOGIN);
    }
  }

  @override
  Future<bool> logout() async {
    Box box = await _getBox();

    if (box.containsKey(BOX_KEY_LOGIN)) {
      box.delete(BOX_KEY_LOGIN);

      return true;
    } else {
      throw CacheException(message: FAILURE_UNKNOWN);
    }
  }
}

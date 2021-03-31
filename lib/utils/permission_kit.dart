import 'package:permission_handler/permission_handler.dart';

class PermissionKit {
  static Future<bool> isGranted(Permission permission) async {
    PermissionStatus status = await permission.status;
    return status == PermissionStatus.granted;
  }

  //检查权限如果没有则申请
  static Future<bool> requestPerssion(Permission permission) async {
    bool _isGranted = await isGranted(permission);
    if (!_isGranted) {
      bool canOpen = await openAppSettings();
      if (canOpen) {
        // PermissionStatus status = await permission.request();
        // return status == PermissionStatus.granted;
        return true;
      } else {
        return false;
      }

      // PermissionStatus status = await permission.request();
      // return status == PermissionStatus.granted;
      // return await requestPerssion(permission);
      // PermissionStatus status = await permission.request();

    }
    return _isGranted;
  }

  // //打开权限设置洁面
  // Future<bool> openAppSetting(Permission permission)async{
  //   return permission.
  // }

}

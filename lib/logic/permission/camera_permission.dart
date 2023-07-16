import 'package:camera/camera.dart';
import 'package:expence_project/logic/permission/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CameraImagePickerHandler extends SavePermissionHandler {
  Future<bool> requestCameraPermision() async {
    bool? getStatusCamera;
    await SharedPreferences.getInstance().then((value) {
      getStatusCamera = value.getBool('camera_permission') ?? false;
    });
    if (getStatusCamera!) return true;
    final permissionStatus = await Permission.camera.request();
    final granted = permissionStatus == PermissionStatus.granted;
    if (granted) {
      await savePermissionStatus('camera_permission', true);
    }
    return granted;
  }
}

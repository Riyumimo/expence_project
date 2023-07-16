import 'package:expence_project/logic/permission/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GaleryPermissionHandler extends SavePermissionHandler {
  Future<bool> requestGalleryPermission() async {
    final prefs = await SharedPreferences.getInstance();
    final galleryPermissionStatus =
        prefs.getBool('gallery_permission') ?? false;

    if (galleryPermissionStatus) return true;

    final permissionStatus = await Permission.storage.request();
    final granted = permissionStatus == PermissionStatus.granted;

    if (granted) {
      await savePermissionStatus('gallery_permission', true);
    }

    return granted;
  }
}

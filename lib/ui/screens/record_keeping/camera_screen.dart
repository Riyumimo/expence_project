import 'package:camera/camera.dart';
import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/router.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void>? _cameraInitializeFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _cameraInitializeFuture = _cameraController.dispose();
    // _cameraController.dispose();
    print('disposekan');
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    _cameraController = CameraController(
      camera,
      ResolutionPreset.high,
    );
    setState(() {
      _cameraInitializeFuture = _cameraController.initialize();
    });
  }

  Future<void> _imageCapture() async {
    if (!_cameraController.value.isInitialized) {
      return;
    }
    try {
      await _cameraInitializeFuture;
      final image = await _cameraController.takePicture();
      appRoute.pop<String>(image.path);
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: FutureBuilder<void>(
        future: _cameraInitializeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _imageCapture,
        child: Icon(Icons.camera),
      ),
    );
  }
}

import 'package:app/widgets/top_nav.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen(
      {Key? key, required this.cameraController, required this.initCamera})
      : super(key: key);
  final CameraController? cameraController;
  final Future<void> Function({required bool frontCamera}) initCamera;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _isFrontCamera = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        (widget.cameraController == null)
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)),
              )
            : GestureDetector(
                onDoubleTap: () {
                  _isFrontCamera = !_isFrontCamera;
                  widget.initCamera(frontCamera: _isFrontCamera);
                },
                child: CameraPreview(widget.cameraController!),
              ),
        TopBar(),
        Positioned(
            bottom: 95,
            child: Row(
              children: [
                Image.asset(
                  'assets/history.png',
                  scale: 1.5,
                ),
                Image.asset('assets/snap.png'),
                Image.asset(
                  'assets/collections.png',
                  scale: 1.3,
                )
              ],
            ))
      ],
    );
  }
}

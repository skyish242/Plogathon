import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  bool _flashOn = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 32, right: 32, top: 64, bottom: 20),
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: SvgPicture.asset("assets/back.svg",
                        semanticsLabel: 'Navigate Back'),
                    onPressed: () => Navigator.pop(context)),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  "Plogging",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                )
              ],
            ),
          ),
          Flexible(
              child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SizedBox(
                          width: size.width,
                          height: (size.height - 24),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: 100,
                              child: CameraPreview(_controller),
                            ),
                          ));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.only(top: 28, right: 28),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _flashOn = !_flashOn;
                      });
                    },
                    iconSize: 48.0,
                    color: _flashOn
                        ? const Color(0xFFEDFB92)
                        : const Color(0xFF747474),
                    icon: const Icon(
                      Icons.bolt,
                      semanticLabel: 'Toggle Flash',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 72),
                  child: IconButton(
                    icon: SvgPicture.asset("assets/camera.svg",
                        semanticsLabel: 'Take Picture'),
                    onPressed: () async {
                      try {
                        await _initializeControllerFuture;
                        _controller.setFlashMode(
                            _flashOn ? FlashMode.always : FlashMode.off);
                        final image = await _controller.takePicture();

                        if (!context.mounted) return;

                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DisplayPictureScreen(
                              imagePath: image.path,
                            ),
                          ),
                        );
                      } catch (e) {
                        // ignore: avoid_print
                        print(e);
                      }
                    },
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  Future<String> fileToBase64(File file) async {
    final bytes = await file.readAsBytes();
    final base64Str = base64Encode(bytes);
    return base64Str;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.center, child: Image.file(File(imagePath))),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 64, bottom: 20),
              color: Theme.of(context).colorScheme.surface,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: SvgPicture.asset("assets/back.svg",
                          semanticsLabel: 'Navigate Back'),
                      onPressed: () => Navigator.pop(context)),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    "Your Photo",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 64, left: 64, right: 64),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      File imageFile = File(imagePath);
                      fileToBase64(imageFile).then((base64Str) {
                        // PETERRRR
                        const uploadResult = true;
                        const instruction =
                            "Before recycling a Tetra Pak, ensure that it is empty, rinse it out, and flatten it to save space in the recycling bin.";

                        Navigator.pop(context);

                        Navigator.pop(context, {
                          'recylable': uploadResult,
                          'instruction': instruction
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 5, backgroundColor: const Color(0xFFBFECC6)),
                    child: Text(
                      "Upload",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

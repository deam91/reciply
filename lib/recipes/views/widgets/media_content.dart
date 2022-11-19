import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/common/models/constants.dart';

class MediaContent extends StatefulWidget {
  const MediaContent({super.key});

  @override
  State<MediaContent> createState() => _MediaContentState();
}

class _MediaContentState extends State<MediaContent> {
  PlatformFile? _platformFile;
  UploadTask? uploadTask;

  _uploadFile() async {
    if (_platformFile != null) {
      final path = '$firebaseImagesPath${_platformFile!.name}';
      final file = File(_platformFile!.path!);

      final ref = FirebaseStorage.instance.ref().child(path);
      setState(() {
        uploadTask = ref.putFile(file);
      });
      final snapshot = await uploadTask!.whenComplete(() {});

      final url = await snapshot.ref.getDownloadURL();
      print('Download Link: $url');
      setState(() {
        uploadTask = null;
      });
    }
  }

  _pickFile(FileType type) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: type);
    if (result != null) {
      if (type == FileType.image) {
        setState(() {
          _platformFile = result.files.first;
        });
        _uploadFile();
      }
    } else {
      // User canceled the picker
    }
  }

  _buildProgress() => StreamBuilder(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.requireData;
            double progress = data.bytesTransferred / data.totalBytes;
            return CircularProgressIndicator.adaptive(
              value: 100 * progress,
            );
          }
          return Container();
        },
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: .5,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withOpacity(.15),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _platformFile != null
                  ? Image.file(
                      File(_platformFile!.path!),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : null,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _platformFile != null
                ? const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child:
              uploadTask != null ? _buildProgress() : const SizedBox.shrink(),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: _platformFile == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Upload your media content',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            backgroundColor: Colors.black.withOpacity(.4),
                            foregroundColor: Colors.white.withOpacity(.8),
                          ),
                          onPressed: () {
                            _pickFile(FileType.image);
                          },
                          icon: const Icon(
                            Icons.image_search_rounded,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Image',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : null,
        ),
      ],
    );
  }
}

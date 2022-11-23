import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/common/models/constants.dart';

class MediaContent extends ConsumerStatefulWidget {
  const MediaContent({required this.onImageUploaded, super.key});
  final Function(String) onImageUploaded;

  @override
  ConsumerState<MediaContent> createState() => _MediaContentState();
}

class _MediaContentState extends ConsumerState<MediaContent> {
  PlatformFile? _platformFile;
  UploadTask? uploadTask;

  _uploadFile() async {
    final userId = ref.read(authControllerProvider.notifier).fbUser?.uid;
    if (_platformFile != null) {
      final path = '$firebaseImagesPath/$userId/${_platformFile!.name}';
      final file = File(_platformFile!.path!);

      final ref = FirebaseStorage.instance.ref().child(path);
      setState(() {
        uploadTask = ref.putFile(file);
      });
      final snapshot = await uploadTask!.whenComplete(() {});

      final url = await snapshot.ref.getDownloadURL();
      widget.onImageUploaded(url);
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
            print(progress * 100);
            return Center(
              child: CircularProgressIndicator(
                value: progress,
              ),
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
        // Image container
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: .5,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(.05),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _platformFile != null && _platformFile?.path != null
                  ? Image.file(
                      File(_platformFile!.path!),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : null,
            ),
          ),
        ),
        // Close button
        Positioned(
          top: 10,
          right: 10,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _platformFile != null
                ? SizedBox(
                    height: 30,
                    width: 30,
                    child: IconButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color(0xff129575).withOpacity(.5)),
                      padding: const EdgeInsets.all(0),
                      iconSize: 20,
                      onPressed: () {
                        setState(() {
                          _platformFile = null;
                          widget.onImageUploaded('');
                        });
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                : null,
          ),
        ),
        // Upload progress stream showing a circular progress indicator
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child:
              uploadTask != null ? _buildProgress() : const SizedBox.shrink(),
        ),
        // Text and button for open the file picker
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: _platformFile == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Upload your recipe image',
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
                            backgroundColor: Colors.white.withOpacity(.85),
                          ),
                          onPressed: () {
                            _pickFile(FileType.image);
                          },
                          icon: const Icon(
                            Icons.image_search_rounded,
                            color: Color(0xff129575),
                          ),
                          label: const Text(
                            'Image',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff129575),
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

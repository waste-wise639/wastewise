import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/reusables.dart';

class UploadImgWidget extends StatefulWidget {
  final String txt;
  final Function(File?)? onImageSelected; // callback if parent needs image

  const UploadImgWidget({super.key, required this.txt, this.onImageSelected});

  @override
  State<UploadImgWidget> createState() => _UploadImgWidgetState();
}

class _UploadImgWidgetState extends State<UploadImgWidget> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();

    // Show dialog options
    final choice = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.black),
                title: kTxt(
                  text: 'Take a Picture',
                  size: 16,
                  weight: FontWeight.w500,
                  color: kColors.blackColor,
                ),

                onTap: () => Navigator.pop(context, "camera"),
              ),
              ListTile(
                leading: const Icon(Icons.photo, color: Colors.black),
                title: kTxt(
                  text: 'Choose from Gallery',
                  size: 16,
                  weight: FontWeight.w500,
                  color: kColors.blackColor,
                ),
                onTap: () => Navigator.pop(context, "gallery"),
              ),
            ],
          ),
    );

    if (choice == null) return;

    XFile? pickedFile;
    if (choice == "camera") {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else if (choice == "gallery") {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile!.path);
      });
      if (widget.onImageSelected != null) {
        widget.onImageSelected!(_selectedImage);
      }
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
    if (widget.onImageSelected != null) {
      widget.onImageSelected!(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kTxt(text: widget.txt, color: kColors.blackColor, size: 13),
        Height(h: 0.5),
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            height: hp(12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: kColors.textGrey.withOpacity(0.3)),
              image:
                  _selectedImage != null
                      ? DecorationImage(
                        image: FileImage(_selectedImage!),
                        fit: BoxFit.cover,
                      )
                      : null,
            ),
            child:
                _selectedImage == null
                    ? Center(
                      child: Image.asset(kImages.uploadimg, height: hp(3)),
                    )
                    : Stack(
                      children: [
                        Positioned(
                          top: 6,
                          right: 6,
                          child: GestureDetector(
                            onTap: _removeImage,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black54,
                              ),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
          ),
        ),
      ],
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pander/core/widgets/generic_appbar.dart';

class ImageViewerWidget extends StatelessWidget {
  final File image;

  const ImageViewerWidget({Key key, this.image}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Scaffold(
        appBar: getBaseAppbar(''),
        body: Container(
          child: Center(
            child: Text('No image to show'),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: getBaseAppbar(''),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: FileImage(image)
            )
          ),
        ),
      );
    }
  }
}
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageWidget extends StatelessWidget {
  final File image;
  final ValueChanged<ImageSource> onClicked;

  const ImageWidget(
    this.image,
    this.onClicked,
  );

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(context),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    final imagePath = this.image.path;
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: 160,
          height: 160,
          child: InkWell(
            onTap: () async {
              final source = await showImageSource(context);

              if (source == null) return;

              onClicked(source);
            },
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
      buildCircle(
        Icon(
          Icons.edit,
          color: Colors.white,
          size: 20,
        ),
        8,
        color,
      ),
      3,
      Colors.white);

  Widget buildCircle(
    Widget child,
    double all,
    Color color,
  ) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

  showImageSource(BuildContext context) {
    return ImageSource.gallery;
  }
}

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PhotoCard extends StatelessWidget {
  final String thumbnailUrl;

  PhotoCard({
    Key key,
    @required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Image.network(
    //   thumbnailUrl,
    // );

    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: thumbnailUrl,
    );
  }
}

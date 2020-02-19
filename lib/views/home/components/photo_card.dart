import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final String thumbnailUrl;

  PhotoCard({
    Key key,
    @required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      thumbnailUrl,
    );
  }
}

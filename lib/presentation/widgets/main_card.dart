import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class MainCardHome extends StatelessWidget {
  final String imageUrl;
  const MainCardHome({
    Key? key, required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 150,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: kRadius10,
          image:  DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                imageUrl),
          ),
        ),
      ),
    );
  }
}

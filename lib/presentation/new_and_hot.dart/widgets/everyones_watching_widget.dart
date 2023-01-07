import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Text(
          movieName,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w900, color: kWhiteColor),
        ),
        kHeight,
        Text(
          description,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: kGreyColor),
        ),
        kHeight50,
        VideoWidget(url: posterPath),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.near_me_outlined,
              title: "Share",
              iconSize: 27,
              textSize: 12,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 27,
              textSize: 12,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 27,
              textSize: 12,
            ),
            kWidth,
          ],
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}

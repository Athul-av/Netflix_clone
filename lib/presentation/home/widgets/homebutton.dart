import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/description.dart';

Widget Mylistbutton() {
  return Column(
    children: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      Text(
        'My List',
        style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 10),
      )
    ],
  );
}

Widget playbutton() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.9)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.play_arrow, color: Colors.black),
        Text('Play', style: TextStyle(color: Colors.black))
      ],
    ),
  );
}

Widget infobutt(BuildContext context, trending) {
  return Column(
    children: [
      IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => Description(  
                    name: trending[1]['title'],
                    description: trending[1]['overview'],
                    bannerurl: 'https://image.tmdb.org/t/p/w500' +
                        trending[1]['backdrop_path'],
                    posterurl: 'https://image.tmdb.org/t/p/w500' +
                        trending[1]['poster_path'],
                    vote: trending[1]['vote_average'].toString(), 
                    launch_on: '')));
          },
          icon: const Icon(Icons.info_outline, color: Colors.white)),
      Text('Info',
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 10))
    ],
  );
}
 
import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/description.dart';


class trendingMovies extends StatefulWidget {
  const trendingMovies({super.key, required this.trending});

  final List trending;

  @override
  State<trendingMovies> createState() => _trendingMoviesState();
}

class _trendingMoviesState extends State<trendingMovies> {
  List<String> images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
    'assets/images/9.png',
    'assets/images/10.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top 10 Trending on Netflix',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 178,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => Description(
                            name: widget.trending[index]['title'] ??
                                widget.trending[index]['name'],
                            description: widget.trending[index]['overview'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                widget.trending[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                widget.trending[index]['poster_path'],
                            vote: widget.trending[index]['vote_average']
                                .toString(),
                            launch_on: widget.trending[index]['release_date'] ??
                                widget.trending[index]['first_air_date'])));
                  },
                  child: Stack(
                    children: [
                      Positioned(
                        right: -1,
                        child: SizedBox(
                          width: 112,
                          child: Column(
                            children: [
                              Container(
                                height: 168,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500' +
                                                widget.trending[index]
                                                    ['poster_path']))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 90,
                        top: 60,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 1),
                            child: SizedBox(
                                width: 62,
                                height: 119,
                                child: Image(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 138,
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

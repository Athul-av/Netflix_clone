import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/description.dart';

class TvPopular extends StatelessWidget {
  const TvPopular({super.key, required this.tvpopular});

  final List tvpopular;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tv Series',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 178,
            child: ListView.builder(
              itemCount: tvpopular.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => Description(
                            name: tvpopular[index]['name'],
                            description: tvpopular[index]['overview'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                tvpopular[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                tvpopular[index]['poster_path'],
                            vote: tvpopular[index]['vote_average'].toString() ,
                            launch_on: '')));
                  },
                  child: Row(
                    children: [
                      SizedBox(
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
                                              tvpopular[index]
                                                  ['poster_path']))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 12,
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

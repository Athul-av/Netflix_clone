import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/description.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.toprated});

  final List toprated;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Rated Movies',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 178,
            child: ListView.builder(
              itemCount: toprated.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => Description(
                            name: toprated[index]['title'],
                            description: toprated[index]['overview'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                toprated[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                toprated[index]['poster_path'],
                            vote: toprated[index]['vote_average'].toString(),
                            launch_on: toprated[index]['release_date'])));
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
                                              toprated[index]['poster_path']))),
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

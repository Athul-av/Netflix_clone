import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/description.dart';


class UpComing extends StatelessWidget {
  const UpComing({super.key, required this.upcoming});

  final List upcoming;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 9.0),
            child: Text(
              'UpComing Movies',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          SizedBox(
            height: 178,
            child: ListView.builder(
              itemCount: upcoming.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => Description(
                            name: upcoming[index]['title'],
                            description: upcoming[index]['overview'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                upcoming[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                upcoming[index]['poster_path'],
                            vote: upcoming[index]['vote_average'].toString(),
                            launch_on: upcoming[index]['release_date'])));
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
                                              upcoming[index]['poster_path']))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 11,
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

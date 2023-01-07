import 'dart:ui';

import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});

  final String? name, description, bannerurl, posterurl, vote, launch_on;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 340,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 340,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            bannerurl ?? '',
                          ),
                          fit: BoxFit.fill)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.1)),
                    ),
                  ),
                )),
                Positioned(
                    left: 118,
                    top: 80,
                    child: SizedBox(
                      height: 204,
                      width: 148,
                      child: Image.network(
                        posterurl ?? '',
                        fit: BoxFit.fill,
                      ),
                    )),
                Positioned(
                    top: 300,
                    child: SizedBox(
                      height: 39,
                      width: 383,
                      child: Center(
                        child: Text(
                          name ?? 'Not Loaded',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23.0, right: 23),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 250, 83, 71)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Icon(Icons.play_arrow), Text('Play')],
                )),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
              padding: const EdgeInsets.only(
                left: 14,
              ),
              child: Text(
                '  ⭐ Average Rating - $vote',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )),
          const SizedBox(
            height: 18,
          ),
          const SizedBox(
            width: 12,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Text(description ?? '',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 194, 191, 191),
                        fontSize: 15)),
              ),
            ),
          ),
          SizedBox(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        )),
                    Text(
                      'My List',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.thumb_up_outlined,
                          color: Colors.white,
                          size: 26,
                        )),
                    Text(
                      'My List',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                          size: 26,
                        )),
                    Text(
                      'My List',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

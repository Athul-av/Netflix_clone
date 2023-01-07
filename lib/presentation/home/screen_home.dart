import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/home/widgets/constant.dart';
import 'package:netflix_app/presentation/home/widgets/homebutton.dart';
import 'package:netflix_app/presentation/home/widgets/toprated.dart';
import 'package:netflix_app/presentation/home/widgets/trending.dart';
import 'package:netflix_app/presentation/home/widgets/tv.dart';
import 'package:netflix_app/presentation/home/widgets/upcoming.dart';

import 'package:tmdb_api/tmdb_api.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  List upcoming = [];

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
        ApiKeys(apiconstants().apikey, apiconstants().readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
     
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
      upcoming = upcomingresult['results'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        Stack(
          children: 
            [Container(
              height: 465,
              decoration:const  BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://static.wikia.nocookie.net/netflix/images/d/df/The_Pale_Blue_Eye_Poster_no_logo.jpg/revision/latest?cb=20221113042749'),
                      fit: BoxFit.fill)), 
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.center,
                          colors: [
                        Colors.black.withOpacity(1.0),
                        Colors.black.withOpacity(0.0)
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end, 
                    children: [
                     
                      Column(
                        children: [
                          Container(
                            child: Text(
                              'Action • Adventure • Fantasy', 
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Mylistbutton(),
                                playbutton(),
                                infobutt(context, trendingmovies)
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            Container(
              height: 90,
              color: Color.fromARGB(93, 37, 37, 37),
              child: 
               Column(
                 children: [
                   Row( 
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         height: 50,
                         width: 50,
                         decoration: const BoxDecoration(
                             image: DecorationImage(
                                 image: AssetImage('assets/images/logo.png'))),
                       ),
                        Row(
                          children:const [
                            Icon(
                                    Icons.cast,
                                    color: kWhiteColor,
                                    size: 28, 
                                  ),
                                   SizedBox(width: 10,), 
                                     SizedBox(
                                height: 30,
                                width: 30,
                                child: Image(
                                  image: NetworkImage(
                                      'https://i.pinimg.com/originals/0d/dc/ca/0ddccae723d85a703b798a5e682c23c1.png'),
                                ),
                              ),  
                              SizedBox(width: 10,)
                          ],
                        ),
                            
                     ],
                   ),
                   SizedBox(height: 10,), 
                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('TV Shows', ),
                              Text('Movies', ),
                              Text('Categories',),
                            ],
                          ),
                 ],
               ), 
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        UpComing(
          upcoming: upcoming,
        ),
        trendingMovies(trending: trendingmovies),
        TopRated(
          toprated: topratedmovies,
        ),
        TvPopular(
          tvpopular: tv,
        )
      ]),
    );
  }
}

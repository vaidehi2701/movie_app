import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/fade_animation.dart';
import 'package:movie_app/views/episodes_screen.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      bottomNavigationBar: navBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.53,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/stranger_things_background.jpg',
                      fit: BoxFit.fitWidth),
                  ClipRRect(
                    // Clip it cleanly.
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 300,
                          width: 200,
                          child: Image.asset(
                              "assets/images/stranger_things_poster.jpg"),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              primaryColor.withOpacity(0.0),
                              primaryColor,
                            ],
                            stops: const [
                              0.5,
                              1.5
                            ])),
                  )
                ],
              ),
            ),
            playAndPauseButtons(),
            movieNames(),
            movieDetails(),
          ],
        ),
      ),
    );
  }

  Widget playAndPauseButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 44,
          width: 140,
          color: primaryColor,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.play_arrow),
            label: const Text(
              "Watch",
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () => print("it's pressed"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          height: 44,
          width: 140,
          color: primaryColor,
          child: ElevatedButton.icon(
            icon: const Icon(
              Icons.local_movies,
              color: Colors.black,
            ),
            label: const Text(
              "Episodes",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            onPressed: () => buildBottomSheet(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget movieNames() {
    return Column(
      children: const [
        SizedBox(
          height: 15,
        ),
        Text(
          "Stranger Things",
          style: headingextStyle,
        ),
        SizedBox(height: 5),
        Text(
          "8.7 IMDB  ·  50m  ·  2016",
          style: subtitleTextSyule,
        ),
      ],
    );
  }

  Widget movieDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            RichText(
              text: const TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Latest: ",
                    style: TextStyle(
                      color: redColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: "Espisode 8(season 3)",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ]),
            ),
            const SizedBox(height: 10),
            const Text(
              "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying super natural forces, and one strange girl",
              style: subtitleTextSyule,
            ),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.left,
              text: const TextSpan(children: <TextSpan>[
                TextSpan(text: "Genres: ", style: boldedSubtitleTextSyule),
                TextSpan(
                    text: "Drama, Mystery, Sci-Fi & Fantacy",
                    style: subtitleTextSyule),
              ]),
            ),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.left,
              text: const TextSpan(children: <TextSpan>[
                TextSpan(text: "Stars: ", style: boldedSubtitleTextSyule),
                TextSpan(
                    text:
                        "Mille Bobby Brown, Winona Ryder, David Harbour Finn Wolfhard, Caleb McLaughlin, Natalia Dyer.....",
                    style: subtitleTextSyule),
              ]),
            ),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.left,
              text: const TextSpan(children: <TextSpan>[
                TextSpan(text: "Companies: ", style: boldedSubtitleTextSyule),
                TextSpan(
                    text: "21 laps entertainment", style: subtitleTextSyule),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget navBar() {
    return SizedBox(
      height: 95,
      child: Theme(
        data: Theme.of(context).copyWith(
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: redColor,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: const TextStyle(color: redColor))),
        // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow_outlined),
              label: "Movies",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.live_tv),
              label: "TV Shows",
            )
          ],
        ),
      ),
    );
  }

  void buildBottomSheet() async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        context: context,
        backgroundColor: primaryColor,
        isScrollControlled: true,
        builder: (context) {
          return const FadeAnimation(
            delay: 0.4,
            child: EpisodesScreen(),
          );
        });
  }
}

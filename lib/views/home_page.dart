import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/fade_animation.dart';
import 'package:movie_app/views/movie_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navBar(),
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 0, top: 50, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/main_page_image.jpg",
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Flash",
                      style: headingextStyle,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "9.5 IMDB  ·  60m  ·  2018",
                      style: subtitleTextSyule,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "The series follows Barry Allen, portrayed by Grant Gustin, a crime scene investigator who gains super-human speed, which he uses to fight criminals, including others who have also........",
                      style: subtitleTextSyule,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    continueWatching(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget continueWatching() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(children: <TextSpan>[
            TextSpan(
                text: "C",
                style: TextStyle(
                  color: redColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(text: "ontinue", style: titleTextStyle),
            TextSpan(
                text: " W",
                style: TextStyle(
                  color: redColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(text: "atching", style: titleTextStyle),
          ]),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              FadeAnimation(
                delay: 1.4,
                  child:
                      movieItem('assets/images/movie1.jpg', "\$ 15", "Arrow")),
              FadeAnimation(
                delay: 1.6,
                  child:
                      movieItem('assets/images/movie2.jpg', '\$ 18', "Flash")),
              FadeAnimation(
                delay: 1.8,
                  child: movieItem('assets/images/movie3.jpg', "\$ 21",
                      "Legends Of Tommrow")),
              FadeAnimation(
                delay: 2.0,
                  child: movieItem(
                      'assets/images/movie4.png', "\$ 21", "Stranger Things")),
            ],
          ),
        ),
      ],
    );
  }

  Widget movieItem(image, price, food) {
    return InkWell(
      child: AspectRatio(
        aspectRatio: 1 / 1.5,
        child: GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 180,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    )),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomCenter, stops: const [
                        .2,
                        .9
                      ], colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.3),
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Text(
                          food,
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              progressBar(),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MovieScreen()),
        );
      },
    );
  }

  Widget progressBar() {
    return Stack(
      children: <Widget>[
        Container(
          height: 7,
          width: 100,
          decoration: const BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        Container(
          height: 7,
          width: 40,
          decoration: const BoxDecoration(
              color: redColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
      ],
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
          elevation: 1,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Search"),
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
}

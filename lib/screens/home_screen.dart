import 'package:animal_biography/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Animal Biography",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      "Choose Category",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: ListView(
                children: [
                  getContainer(
                    context: context,
                    title: "Mammals",
                    image:
                        "https://africageographic.com/wp-content/uploads/2015/08/lion-cubs1.jpg",
                    total: "5",
                    icon: FontAwesomeIcons.dog,
                    type: "MAMMALS",
                  ),
                  getContainer(
                    context: context,
                    title: "Birds",
                    image:
                        "https://images.unsplash.com/photo-1560879373-069838a49c68?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVycm90fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
                    total: "5",
                    icon: FontAwesomeIcons.dove,
                    type: "BIRDS",
                  ),
                  getContainer(
                    context: context,
                    title: "Fish",
                    image:
                        "https://i.natgeofe.com/n/97755bf1-ba79-4752-a76d-5b809871297f/01-betta-fish-nationalgeographic_2445745.jpg?w=636&h=424",
                    total: "5",
                    icon: FontAwesomeIcons.fish,
                    type: "FISH",
                  ),
                  getContainer(
                    context: context,
                    title: "Reptiles",
                    image:
                        "https://cdn.britannica.com/s:400x225,c:crop/97/152297-050-B0512D16/Chameleon-branch-Madagascar.jpg",
                    total: "5",
                    icon: FontAwesomeIcons.fish,
                    type: "REPTILES",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

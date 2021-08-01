import 'package:animal_biography/helper/db_helper.dart';
import 'package:animal_biography/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  final String type;
  String image;
  String title;
  DetailScreen({required this.type, required this.title, required this.image});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future fetchAnimal;
  @override
  void initState() {
    fetchAnimal = dbh.getAllAnimals(type: widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  Text(
                    "Animals",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffC19E82),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ListView(
                  padding: EdgeInsets.only(top: 25, left: 20),
                  children: [
                    Text(
                      "Related for you",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: FutureBuilder(
                        future: fetchAnimal,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  snapshot.data[index].image),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.38,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        margin: EdgeInsets.only(right: 15),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        snapshot.data[index].name,
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                      SizedBox(height: 5),
                                      SizedBox(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            snapshot.data[index].detail,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Quick Categories",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            child: getCategories(
                                context: context, icon: FontAwesomeIcons.dog),
                            onTap: () {
                              setState(() {
                                fetchAnimal =
                                    dbh.getAllAnimals(type: "MAMMALS");
                                widget.image =
                                    "https://africageographic.com/wp-content/uploads/2015/08/lion-cubs1.jpg";
                                widget.title = "Mammals";
                              });
                            },
                          ),
                          InkWell(
                            child: getCategories(
                                context: context, icon: FontAwesomeIcons.dove),
                            onTap: () {
                              setState(() {
                                fetchAnimal = dbh.getAllAnimals(type: "BIRDS");
                                widget.image =
                                    "https://images.unsplash.com/photo-1560879373-069838a49c68?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVycm90fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80";
                                widget.title = "Birds";
                              });
                            },
                          ),
                          InkWell(
                            child: getCategories(
                                context: context, icon: FontAwesomeIcons.fish),
                            onTap: () {
                              setState(() {
                                fetchAnimal = dbh.getAllAnimals(type: "FISH");
                                widget.image =
                                    "https://i.natgeofe.com/n/97755bf1-ba79-4752-a76d-5b809871297f/01-betta-fish-nationalgeographic_2445745.jpg?w=636&h=424";
                                widget.title = "Fish";
                              });
                            },
                          ),
                          InkWell(
                            child: getCategories(
                                context: context,
                                icon: FontAwesomeIcons.dragon),
                            onTap: () {
                              setState(() {
                                fetchAnimal =
                                    dbh.getAllAnimals(type: "REPTILES");
                                widget.image =
                                    "https://cdn.britannica.com/s:400x225,c:crop/97/152297-050-B0512D16/Chameleon-branch-Madagascar.jpg";
                                widget.title = "Reptiles";
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

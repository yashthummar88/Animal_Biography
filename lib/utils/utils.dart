import 'package:animal_biography/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

InkWell getContainer({
  required BuildContext context,
  required String title,
  required String image,
  required String total,
  required IconData icon,
  required String type,
}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return DetailScreen(
              type: type,
              title: title,
              image: image,
            );
          },
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 15),
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width * 1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
            fit: BoxFit.cover),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Text(
                "Animals",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                color: Colors.white,
              ),
              Text(
                total,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Container getCategories(
    {required BuildContext context, required IconData icon}) {
  return Container(
    child: FaIcon(
      icon,
      size: 70,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
        color: Color(0xffECD1B3).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15)),
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height * 0.025,
    width: MediaQuery.of(context).size.width * 0.35,
    margin: EdgeInsets.only(right: 30),
  );
}

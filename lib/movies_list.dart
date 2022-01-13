import 'package:flutter/material.dart';

import 'appBar.dart';
import 'constants.dart';
import 'data.dart';
import 'day_plan.dart';
import 'drawer.dart';

class MoviesList extends StatefulWidget {
  final roomName;

  MoviesList(this.roomName);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: BuildDrawer(),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: kBoxDecoration,
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    BuildAppBar('Réservi'),
                    const SizedBox(height: 20.0),
                    ListTile(
                      title: Column(
                        children: [
                          Text(
                            'Plan de diffusion des films chez ',
                            style: TextStyle(
                              color: kFirstColor,
                              fontFamily: 'MulishBlack',
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            widget.roomName,
                            style: TextStyle(
                              color: kSecondColor,
                              fontFamily: 'MulishBlack',
                              fontSize: 23.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 0, top: 10.0),
                            height: 35.0,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: days.length,
                              itemBuilder: (context, index) => buildDayPlan(index),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          DayPlan(selectedIndex),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildDayPlan(int indexa) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              style: BorderStyle.solid,
              color: selectedIndex == indexa ? kFirstColor : Colors.transparent,
            ),
          ),
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = indexa;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  days[indexa],
                  style: TextStyle(
                    fontFamily: 'MulishBlack',
                    fontWeight: selectedIndex == indexa ? FontWeight.w900 : FontWeight.w700,
                    color: selectedIndex == indexa ? kFirstColor : kFirstColor.withOpacity(0.5),
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        //_buildMoviesListPerDay(index),
      ],
    );
  }
}

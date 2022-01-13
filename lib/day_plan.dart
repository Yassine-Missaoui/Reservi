import 'package:flutter_tags/flutter_tags.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'data.dart';
import 'movie_details.dart';

class DayPlan extends StatefulWidget {
  final selectedIndex;

  DayPlan(this.selectedIndex);
  @override
  _DayPlanState createState() => _DayPlanState();
}

class _DayPlanState extends State<DayPlan> {
  Widget buildMoviesListPerDay() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(mondayFilms[widget.selectedIndex][0])),
          ),
          height: size.height * 0.35,
          width: size.width * 0.6,
        ),
        SizedBox(height: 20.0),
        Text(
          'First Film of ${days[widget.selectedIndex]}',
          style: TextStyle(
              letterSpacing: 3.0,
              color: kFirstColor
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          width: size.width * 0.9,
          child: Tags(
            itemCount: filmCategories[widget.selectedIndex].length,
            itemBuilder: (int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                padding: EdgeInsets.all(5.0),
                child: Text(
                  filmCategories[widget.selectedIndex][index],
                  style: TextStyle(
                      letterSpacing: 3.0,
                      color: kFirstColor
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    style: BorderStyle.solid,
                    color: kFirstColor,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              );
            },
          ),
        ),
        Container(height: 12),
        Container(
          child: Column(
            children: [
              RichText(maxLines:1,overflow: TextOverflow.ellipsis, text: TextSpan(text: 'Director :     ',style: normalTextStyle,children: [TextSpan(text: 'Todd Phillips',style: normalTextStyle,),])),
              SizedBox(height: size.height/50),
              RichText(maxLines:1,overflow: TextOverflow.ellipsis, text: TextSpan(text: 'Writers :     ',style: normalTextStyle,children: [TextSpan(text: 'Todd Phillips (screenplay)...',style: normalTextStyle,),])),
              SizedBox(height: size.height/50),
              RichText(maxLines:1,overflow: TextOverflow.ellipsis, text: TextSpan(text: 'Stars :     ',style: normalTextStyle,children: [TextSpan(text: 'Todd  Joaquin Phoenix, Zazie...',style: normalTextStyle,),])),
              SizedBox(height: size.height/50),
              RichText(maxLines:1,overflow: TextOverflow.ellipsis, text: TextSpan(text: 'Release Date :     ',style: normalTextStyle,children: [TextSpan(text: '4 October 2019 (UK)',style: normalTextStyle,),])),
            ],
          ),
        ),
        Container(height: 12),
        Tags(
          itemCount: mondayFilms[widget.selectedIndex][1].length,
          itemBuilder: (int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> MovieDetails('${mondayFilms[widget.selectedIndex][1][index]}','First Film of ${days[widget.selectedIndex]}',mondayFilms[widget.selectedIndex][0]))),
                child: Text(
                  mondayFilms[widget.selectedIndex][1][index],
                  style: TextStyle(
                      letterSpacing: 3.0,
                      color: kFirstColor
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                boxShadow: [BoxShadow(blurRadius: 10, color: kFourthColor.withOpacity(0.9), offset: Offset(0, 5),),],
                border: Border.all(
                  width: 1.5,
                  style: BorderStyle.solid,
                  color: kFirstColor,
                ),
              ),
            );
          },
        ),
        Container(height: 20),
      ],
    );
  }

  /// main
  @override
  Widget build(BuildContext context) {
    return buildMoviesListPerDay();/*Column(
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
        _buildMoviesListPerDay(widget.selectedIndex),
      ],
    );*/
  }

  /*Widget buildDayPlan(int index) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              style: BorderStyle.solid,
              color: selectedIndex == index ? kFirstColor : Colors.transparent,
            ),
          ),
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  days[index],
                  style: TextStyle(
                    fontFamily: 'MulishBlack',
                    fontWeight: selectedIndex == index ? FontWeight.w900 : FontWeight.w700,
                    color: selectedIndex == index ? kFirstColor : kFirstColor.withOpacity(0.5),
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
  }*/
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'constants.dart';
import 'data.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;

  Widget _buildCarousel (int ind){
    return Container(
      child: CarouselSlider.builder(
        itemCount: listOfFilmName[ind].length,
        itemBuilder: (_, int index,int f){
          return InkWell(
            onTap: (){
              setState(() {
                print(listOfFilmName[ind][index]);
              });
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                image: DecorationImage(
                  image: AssetImage(listOfFilmImage[ind][index]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 300,
          initialPage: 0,
          autoPlay:true,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          pauseAutoPlayOnTouch: true,
        ),
      ),
    );
  }
  /// main
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
         height: 32,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, indexi) => buildCategory(indexi),
          ),
        ),
        SizedBox(height: 20.0,),
        _buildCarousel(selectedIndex),
      ],
    );
  }

  Widget buildCategory(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                  categories[index],
                  style: TextStyle(
                    fontFamily: 'MulishBlack',
                    fontWeight: selectedIndex == index ? FontWeight.w900 : FontWeight.w700,
                    color: selectedIndex == index ? kFirstColor : kThirdColor.withOpacity(0.5),
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.0),
                  height: 3,
                  width: 30.0,
                  color: selectedIndex == index ? kFirstColor : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

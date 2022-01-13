import 'package:flutter/material.dart';
import 'appBar.dart';
import 'carousel_widget.dart';
import 'constants.dart';
import 'data.dart';
import 'package:firebase_core/firebase_core.dart';

import 'drawer.dart';
import 'rooms.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String FirstCountry = '';
  String myActivityResult= '';
  TextEditingController _searchWord = TextEditingController();

  String? value;

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: kFirstColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextField(
        cursorColor: kSecondColor,
        controller: _searchWord,
        style: TextStyle(
          color: kSecondColor,
          fontFamily: 'RobotoMono',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0, right: 14.0),
          prefixIcon: Icon(
            Icons.search,
            color: kSecondColor,
          ),
          hintText: 'Search for something ?',
          hintStyle: TextStyle(
            color: kSecondColor.withOpacity(0.7),
            fontFamily: 'MunichBlack',
          ),
        ),
      ),
    );
  }

  Widget _buildDropDownButton() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Region:',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: kFirstColor,
                fontFamily: 'MunishBlack',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5),
          ),
          Container(
            decoration: BoxDecoration(
              color: kFirstColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.6,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                disabledHint: Text(''),
                isExpanded: true,
                value: value,
                iconSize: 36.0,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: kSecondColor,
                ),
                items: Countries.map(_buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value as String?;
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: BuildDrawer(),
        /*appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Réservi',
            style: TextStyle(
              color: kFirstColor,
              fontFamily: 'MulishBlack',
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout),
            ),
          ],
          iconTheme: IconThemeData(
            color: kFirstColor,
          ),
        ),*/
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
                    SizedBox(height: 20),
                    _buildSearchBar(),
                    SizedBox(height: 40.0),
                    Categories(),
                    SizedBox(height: 30.0),
                    _buildDropDownButton(),
                    SizedBox(height: 20.0),
                    if(value != null)
                      Container(
                        decoration: BoxDecoration(
                          color: kFirstColor ,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: TextButton(
                          child: Text('Confirm region',
                            style: TextStyle(
                              color: kSecondColor,
                              fontFamily: 'MunishBlack',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Rooms(value)));
                          },
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

  DropdownMenuItem<String> _buildMenuItem(item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
          color: kSecondColor,
          fontFamily: 'MunishBlack',
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reservi2/appBar.dart';

import 'data.dart';
import 'movies_list.dart';
import 'constants.dart';
import 'drawer.dart';

class Rooms extends StatefulWidget {
  final roomName;

  const Rooms(this.roomName);

  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
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
                      title: Text(
                        'Les salles de cinéma à ${widget.roomName}',
                        style: TextStyle(
                          color: kFirstColor,
                          fontFamily: 'MulishBlack',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [const Divider(color: Colors.black45,),
                          for (int i=1; i< salles.length; i++)
                            Card(
                              color: kFirstColor,
                              child: ListTile(
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios_outlined,color: kSecondColor,),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesList(salles[i])));
                                  },
                                ),
                                leading: Icon(Icons.movie_rounded,size: 30.0,color: kSecondColor,),
                                title: Text(salles[i]),
                                subtitle: Text('roomAddress $i' ,style: TextStyle(color: kSecondColor,),),
                              ),
                            ),],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

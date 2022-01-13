import 'package:flutter/material.dart';

import 'constants.dart';
import 'login_screen.dart';

class BuildAppBar extends StatelessWidget {
  final roomName;
  BuildAppBar(this.roomName);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: const BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            roomName,
            style: TextStyle(
              color: kFirstColor,
              fontFamily: 'MulishBlack',
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          IconButton(
            color: kFirstColor,
            onPressed: () {
              showDialog(
                useSafeArea: false,
                barrierColor: Colors.black87,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: kFourthColor,
                    title: Text(
                      'Logout',
                      style: kTitleStyle,
                    ),
                    content: Text(
                      'Do you want to logout ?',
                      style: normalTextStyle,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'No',
                          style: normalTextStyle,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInWithEmail()));
                        },
                        child: Text(
                          'Yes',
                          style: normalTextStyle,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}

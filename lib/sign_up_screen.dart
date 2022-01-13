import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/services.dart';

import 'main_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool showLoading = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: inputBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: normalTextStyle,
            decoration: InputDecoration(
              focusColor: kFourthColor,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0,right: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: kFirstColor,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          decoration: inputBoxDecorationStyle,
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            style: normalTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0,right: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: kFirstColor,
              ),
              hintText: 'Enter new Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: inputBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _confirmPasswordController,
            obscureText: true,
            style: normalTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0,right: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: kFirstColor,
              ),
              hintText: 'Confirm your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async{
          try {
            setState(() {
              showLoading=false;
            });
            if(_confirmPasswordController.text==_passwordController.text){
              UserCredential userCredential  = await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
              Navigator.pushReplacementNamed(context,'/MainScreen');
            }else{
              throw('Confirm your password please');
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString().contains('network-request-failed') ? 'Network request failed ' : e.toString()),backgroundColor: Colors.black54,));
            setState(() {
              showLoading=false;
            });
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: kFirstColor,
        child: Text(
          'Sign up',
          style: LoginButtonTextStyle,
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacementNamed(context, '/SignInWithEmail');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'You have an Account? ',
              style: normalTextStyle,
            ),
            TextSpan(
              text: '  Sign In',
              style: SecondTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: kTitleStyle,
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(height: 30.0,),
                      _buildPasswordTF(),
                      SizedBox(height: 30.0,),
                      _buildConfirmPasswordTF(),
                      SizedBox(height: 30.0,),
                      _buildLoginBtn(),
                      SizedBox(height: 30.0,),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
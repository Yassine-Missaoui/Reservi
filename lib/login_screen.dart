import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:reservi2/services/google_sign_in.dart';
import 'constants.dart';
import 'services/auth_service.dart';

import 'main_screen.dart';


class SignInWithEmail extends StatefulWidget {
  @override
  _SignInWithEmailState createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {

  bool showLoading = false ;
  bool obscure = true;
  AuthClass authClass = AuthClass();
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
        SizedBox(height: 20.0,),
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: inputBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _passwordController,
            obscureText: obscure,
            style: normalTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0,right: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: kFirstColor,
              ),
              suffixIcon: InkWell(
                onTap: (){
                  setState(() {
                    obscure =!obscure;
                  });
                },
                child: Icon(
                  obscure ? Icons.visibility : Icons.visibility_off,
                  color: kFirstColor,
                ),
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        color:  Colors.transparent,
        onPressed: (){},
        /*onPressed: () async {
          var response = await checkEmail();
          setState(() {
            this._emailValidator = response;
          });
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            try {
              await widget.auth.sendPasswordResetEmail(_email);
            } catch (e) {
              print(e);
            }
          }

        },*/
        child: Text(
          'Forgot Password?',
          style: SecondTitleTextStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        color: kFirstColor,
        padding: EdgeInsets.all(15.0),
        child: Text(
          'LOGIN',
          style: LoginButtonTextStyle,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () async{
          try {
            UserCredential userCredential = await _auth.signInWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            );
            setState(() {
              showLoading=false;
            });
            Navigator.pushReplacementNamed(context,'/MainScreen');
          } on Exception catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString().contains('firebase_auth/network-request-failed') ? 'Network request failed ' : e.toString()),backgroundColor: Colors.black54,dismissDirection: DismissDirection.horizontal,elevation: 3,));
            setState(() {
              showLoading=false;
            });
          }
        },
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          'Or sign in with',
          style: TextStyle(
              color: kFirstColor,
              fontFamily: 'MunishBlack',
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5
          ),
        ),
      ],
    );
  }
  Widget _buildGoogleSignInBtn(logo){
    return GestureDetector(
      onTap: ()async{
        //await authClass.googleLogin(context);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kFirstColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(5,2),
              blurRadius: 6.0,

            ),
          ],
          image: DecorationImage(
            image: AssetImage(logo),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildSocialMethodeBtn('assets/google_icon.png',(){}),
          //_buildSocialMethodeBtn(Buttons.Facebook,(){}),
          //_buildSocialMethodeBtn(Buttons.Facebook,(){}),
          _buildSocialMethodeBtn('assets/facebook_icon.png',(){}),
          //_buildSocialMethodeBtn(Buttons.Google,(){}),
        ],
      ),
    );
  }

  Widget _buildSocialMethodeBtn(logo,function){
    return Container(
      height: 75.0,
      width: 75.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kFirstColor,
      ),
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kFirstColor,
          boxShadow: [
            /*BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),*/
          ],
          image: DecorationImage(
            image: AssetImage(logo),
          ),
        ),
      ),
    );
  }




  /*Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: AssetImage(logo),
          ),
        ),
      ),*/


  Widget _buildSigninText(){
    return Text(
      'Sign In',
      style: kTitleStyle,
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacementNamed(context, '/SignUpScreen');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: normalTextStyle,
            ),
            TextSpan(
              text: '  Sign Up',
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
                //height: double.infinity,
                width: double.infinity,
                decoration: kBoxDecoration,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 80.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _buildSigninText(),
                      SizedBox(height: 30,),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildLoginBtn(),
                      _buildSignupBtn(),
                      SizedBox(height: 40.0),
                      _buildSignInWithText(),
                      SizedBox(height: 30.0),
                      _buildSocialBtnRow(),
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
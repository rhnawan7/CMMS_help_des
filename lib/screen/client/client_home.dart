import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/theme_helper.dart';
import '../../pages/forgot_password_page.dart';
import '../../pages/forgot_password_verification_page.dart';
import '../../pages/login_client.dart';
import '../../pages/registration_client.dart';
import '../../pages/splash_screen.dart';
import 'orderno.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
class ClientHome extends StatefulWidget {
  static const String id = 'HomeScreen';
  ClientHome({Key? key}) : super(key: key);

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {

  final double  _drawerIconSize = 24;
  final double _drawerFontSize = 17;
  double latitude = 0.0;
  double longitude = 0.0;
  late String _company;
  bool isLoading = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text('Customer Service Help'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).accentColor.withOpacity(0.5),
                  ]
              )
          ) ,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor,Theme.of(context).accentColor,],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text("CMMS Help Desk",
                    style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.screen_lock_landscape_rounded, size: _drawerIconSize, color: Theme.of(context).accentColor,),
                title: Text('Splash Screen', style: TextStyle(fontSize: 17, color: Theme.of(context).accentColor),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: "Splash Screen")));
                },
              ),
              ListTile(
                leading: Icon(Icons.login_rounded,size: _drawerIconSize,color: Theme.of(context).accentColor),
                title: Text('Login Page', style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.person_add_alt_1, size: _drawerIconSize,color: Theme.of(context).accentColor),
                title: Text('Registration Page',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.password_rounded, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Forgot Password Page',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.verified_user_sharp, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Verification Page',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => ForgotPasswordVerificationPage()), );
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(children: [Container(
       child: Row(
         children: [
           Container(
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
             Text('Status'),
             Text('Request #'),
             Text('Technician'),
             Text('Cell #'),
           ],),),
           SizedBox(width: 10.0,),
           Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Text('In Process'),
             Text('2023123433 #'),
             Text('Stalin'),
             Text('311345577774 #'),
           ],),),
         ],
       ),
        ),
        SizedBox(height: 100.0,),
        Container(
          child: Column(
            children: [
              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text('Genrat Request'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderNumberGenerator()));
                  }
                ),
              ),
            ],
          ),
        ),

      ],),

    );
  }
}



import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:safra_market/routes.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Carousel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Carousel Demo'),
      //home: LoginPage(),
      routes: routes,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  @override
  Widget build(BuildContext context) {

    final accountField = TextField(
      obscureText: false,
      //style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Account",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      //style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff151e45),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
          textAlign: TextAlign.center,
          style: TextStyle(color:Colors.white),
          // style: style.copyWith(
          //     color: Colors.white, fontWeight: FontWeight.bold)
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 300.0,
                  child: Image.asset(
                    "assets/saframarket_logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                accountField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageLinks = [
    'https://homepages.cae.wisc.edu/~ece533/images/fruits.png',
    'https://homepages.cae.wisc.edu/~ece533/images/cat.png',
    'https://homepages.cae.wisc.edu/~ece533/images/peppers.png',
    'https://homepages.cae.wisc.edu/~ece533/images/tulips.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: ListView(children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.network(
                        imageLinks[0],
                        fit: BoxFit.cover,
                      ))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),

                  child: Text('SAFRA',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 40))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: CarouselSlider(
                    // height: 200.0,
                    items: imageLinks.map((imageLink) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.network(
                                imageLink,
                                fit: BoxFit.cover,
                              ));
                        },
                      );
                    }).toList(),

                    // reverse: false,
                    // //is false by default (reverses the order of items)
                    // enableInfiniteScroll: true,
                    // //is true by default (it scrolls back to item 1 after the last item)
                    // autoPlay: true,
                    // //is false by default
                    // initialPage: 0,
                    // //allows you to set the first item to be displayed
                    // scrollDirection: Axis.horizontal,
                    // //can be set to Axis.vertical
                    // pauseAutoPlayOnTouch: Duration(seconds: 5),
                    // //it pauses the sliding if carousel is touched,
                    // onPageChanged: (int pageNumber) {
                    //   //this triggers everytime a slide changes
                    // },
                    // viewportFraction: 0.8,
                    // // enlargeCenterPage: true, //is false by default
                    // aspectRatio: 16 /
                    //     9, //if height is not specified, then this value is used
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: CarouselSlider(
                    // height: 200.0,
                    items: imageLinks.map((imageLink) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.network(
                                imageLink,
                                fit: BoxFit.cover,
                              ));
                        },
                      );
                    }).toList(),

                    // reverse: false,
                    // //is false by default (reverses the order of items)
                    // enableInfiniteScroll: true,
                    // //is true by default (it scrolls back to item 1 after the last item)
                    // autoPlay: true,
                    // //is false by default
                    // initialPage: 0,
                    // //allows you to set the first item to be displayed
                    // scrollDirection: Axis.horizontal,
                    // //can be set to Axis.vertical
                    // pauseAutoPlayOnTouch: Duration(seconds: 5),
                    // //it pauses the sliding if carousel is touched,
                    // onPageChanged: (int pageNumber) {
                    //   //this triggers everytime a slide changes
                    // },
                    // viewportFraction: 0.8,
                    // enlargeCenterPage: true,
                    // //is false by default
                    // aspectRatio: 16 /
                    //     9, //if height is not specified, then this value is used
                  ))
            ])));
  }
}

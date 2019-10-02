import 'package:flutter/material.dart';

void main() {
  runApp(new Myapp());
}
// stateless widget taken
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //widget is the returntype
    return new MaterialApp(
      title: "stateless",
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: new Loginpage(), //home is of class type
    );
  }
}
//Statefull widget
class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconanimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconanimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2000));
    _iconAnimation = new CurvedAnimation(
        parent: _iconanimationController, curve: Curves.easeInOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,

        //this is the first children
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/IMG_20190130_153655_274.jpg"),
            fit: BoxFit.cover,
            color: Colors.yellow,
            colorBlendMode: BlendMode.darken,
          ),
          //this is second children in the form of coloumn
//------------------------------------------------------------------------------
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
//------------------------------------------------------------------------------
              new Form(
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.teal, fontSize: 20.0))),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "ENTER EMAIL",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "ENTER PASSWORD",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true),
                        new Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                        ),
                        new MaterialButton(
                          color: Colors.teal,
                          textColor: Colors.black,
                          child: new Icon(Icons.home),
                          onPressed: () => {},
                          splashColor: Colors.pink,
                        )
                      ],
                    ),
                  ),
                ),
              )
//------------------------------------------------------------------------------
            ],
          )
        ],
      ),
    );
  }
}

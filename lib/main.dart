import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String email, pwd;

  void _submit() {
    // validar si el formulario se ha rellenado correctamente
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      if (email == 'carlota@gmail.com' && pwd == '123') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return MySecondHomePage(
              mail: email,
              pwd: pwd,
            );
          }),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Welcome back!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Login to your account now',
              ),
              SizedBox(
                height: 60,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                        labelText: 'Email address',
                        labelStyle: TextStyle(),
                      ),
                      validator: (input) =>
                          !input.contains('@') ? 'email no válido' : null,
                      onSaved: (input) => email = input,
                    ),
                    TextFormField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      onSaved: (input) => pwd = input,
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: Textos(
                            txt: 'Remember Me',
                          ),
                        ),
                        Expanded(
                          child: Textos(
                              txt: 'Forget Password?', align: TextAlign.right),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            shape: Border(),
                            elevation: 2.0,
                            color: Colors.grey[800],
                            onPressed: _submit, // metodo _submit
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Textos(
                  txt: 'Log In With',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconosRedes(
                    iconos: FontAwesomeIcons.facebook,
                    color: Colors.blue[900],
                    onpress: () {},
                  ),
                  IconosRedes(
                    iconos: FontAwesomeIcons.google,
                    color: Colors.red[900],
                    onpress: () {},
                  ),
                  IconosRedes(
                    iconos: FontAwesomeIcons.twitter,
                    color: Colors.blue[300],
                    onpress: () {},
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Don\'t have an account?'),
                      Text('Sign up here',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconosRedes extends StatelessWidget {
  final IconData iconos;
  final Function onpress;
  final Color color;
  IconosRedes(
      {@required this.iconos, @required this.onpress, @required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: FaIcon(
          iconos,
          color: color,
        ),
        onPressed: onpress);
  }
}

class Textos extends StatelessWidget {
  final String txt;
  final TextAlign align;

  Textos({@required this.txt, this.align});
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(color: Colors.grey),
      textAlign: align,
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:safra_market/auth.dart';
import 'package:safra_market/data/database_helper.dart';
import 'package:safra_market/models/user.dart';
import 'package:safra_market/screens/login/login_screen_presenter.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>
    implements LoginScreenContract, AuthStateListener {
  BuildContext _ctx;

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _password, _accountId;

  LoginScreenPresenter _presenter;

  LoginScreenState() {
    _presenter = new LoginScreenPresenter(this);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      // setState(() => _isLoading = true);
      form.save();
      //Navigator.of(_ctx).pushNamed("/home", arguments: new User('FakeUser', 'FakePassword', 'Fulano'));
      _presenter.doLogin(_accountId, _password);
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  onAuthStateChanged(AuthState state) {
    if (state == AuthState.LOGGED_IN)
      Navigator
          .of(_ctx)
          .pushReplacementNamed
    ("/home", arguments: new User('FakeUser', 'FakePassword', 'Fulano'));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    final accountField = new TextFormField(
      onSaved: (val) => _accountId = val,
      validator: (val) {
        return val.length < 10
            ? "Account ID must have at least 11 chars"
            : null;
      },
      decoration: new InputDecoration(labelText: "Account ID"),
    );
    final passwordField = new TextFormField(
      onSaved: (val) => _password = val,
      decoration: new InputDecoration(labelText: "Password"),
    );
    var loginButon = new Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff151e45),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _submit,
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
          // style: style.copyWith(
          //     color: Colors.white, fontWeight: FontWeight.bold)
        ),
      ),
    );

    var loginForm = new Column(
      children: <Widget>[
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              Padding(
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
                  ],
                ),
              ),
            ],
          ),
        ),
        _isLoading ? new CircularProgressIndicator() : loginButon
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );

    return new Scaffold(
      appBar: null,
      //resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      body: new Center(
          child: ListView(shrinkWrap: true, children: [
            Container(
                color: Colors.white,
                child:
                Padding(padding: const EdgeInsets.all(36.0), child: loginForm))
          ])),
    );
  }

  @override
  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
    // setState(() => _isLoading = false);
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    // setState(() => _isLoading = false);
    var db = new DatabaseHelper();
    await db.saveUser(user);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.notify(AuthState.LOGGED_IN);
  }
}

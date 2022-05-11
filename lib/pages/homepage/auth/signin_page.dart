import 'package:animal/core/utils/exception_handling_widget_mixin.dart';
import 'package:animal/models/auth/auth.dart';
import 'package:animal/pages/homepage/auth/signup_page.dart';
import 'package:animal/pages/homepage/home_page.dart';
import 'package:animal/pages/splash_page.dart';
import 'package:animal/stores/auth_store.dart';
import 'package:animal/stores/root_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> with HandleExceptions {
  double getSmallDiameter(BuildContext context) => MediaQuery.of(context).size.width * 2 / 3;

  double getBiglDiameter(BuildContext context) => MediaQuery.of(context).size.width * 7 / 8;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AuthStore _authStore;

  @override
  void initState() {
    super.initState();

    () async {
      await Future.delayed(Duration.zero);
    }();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authStore = Provider.of<RootStore>(context).authStore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Theme.of(context).primaryColor, Colors.blue],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: -getBiglDiameter(context) / 4,
            top: -getBiglDiameter(context) / 4,
            child: Container(
              child: const Center(
                child: Text(
                  "Adoppet",
                  style: TextStyle(fontFamily: "Pacifico", fontSize: 40),
                ),
              ),
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Theme.of(context).primaryColor, Colors.blue],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            right: -getBiglDiameter(context) / 2,
            bottom: -getBiglDiameter(context) / 2,
            child: Container(
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Theme.of(context).primaryColor, Colors.blue],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                  padding: const EdgeInsets.all(20),
                  child: _authStore.signinState.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          children: <Widget>[
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  icon: const Icon(
                                    Icons.email,
                                  ),
                                  focusedBorder:
                                      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade100)),
                                  labelText: "Email",
                                  enabledBorder: InputBorder.none,
                                  labelStyle: const TextStyle(color: Colors.grey)),
                            ),
                            TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  icon: const Icon(
                                    Icons.vpn_key,
                                  ),
                                  focusedBorder:
                                      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade100)),
                                  labelText: "Password",
                                  enabledBorder: InputBorder.none,
                                  labelStyle: const TextStyle(color: Colors.grey)),
                            ),
                          ],
                        ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 40,
                    child: Container(
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: Colors.amber,
                          onTap: () async {
                            Auth auth = Auth(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            await _authStore.signin(auth);

                            if (_authStore.signinState.isError) {
                              showErrorMessage(context, _authStore.signinState.errorMessage);
                              return;
                            }
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SplashPage()));
                          },
                          child: const Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [Theme.of(context).primaryColor, Colors.blue],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "DON'T HAVE AN ACCOUNT ? ",
                      style: TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                      ),
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

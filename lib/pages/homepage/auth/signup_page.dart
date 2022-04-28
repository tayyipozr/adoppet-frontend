import 'package:animal/core/utils/exception_handling_widget_mixin.dart';
import 'package:animal/models/auth/auth.dart';
import 'package:animal/stores/auth_store.dart';
import 'package:animal/stores/root_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with HandleExceptions {
  double getSmallDiameter(BuildContext context) => MediaQuery.of(context).size.width * 2 / 3;

  double getBiglDiameter(BuildContext context) => MediaQuery.of(context).size.width * 7 / 8;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

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
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFB226B2), Color(0xFFFF6DA7)],
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
                  "dribblee",
                  style: TextStyle(fontFamily: "Pacifico", fontSize: 40, color: Colors.white),
                ),
              ),
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
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
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF3E9EE)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                  padding: const EdgeInsets.all(20),
                  child: _authStore.signupState.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          children: <Widget>[
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  icon: const Icon(
                                    Icons.email,
                                    color: Color(0xFFFF4891),
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
                                    color: Color(0xFFFF4891),
                                  ),
                                  focusedBorder:
                                      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade100)),
                                  labelText: "Password",
                                  enabledBorder: InputBorder.none,
                                  labelStyle: const TextStyle(color: Colors.grey)),
                            ),
                            TextField(
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                  focusedBorder:
                                      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade100)),
                                  labelText: "First Name",
                                  enabledBorder: InputBorder.none,
                                  labelStyle: const TextStyle(color: Colors.grey)),
                            ),
                            TextField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                  focusedBorder:
                                      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade100)),
                                  labelText: "Last Name",
                                  enabledBorder: InputBorder.none,
                                  labelStyle: const TextStyle(color: Colors.grey)),
                            )
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
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                            );
                            await _authStore.signup(auth);

                            if (_authStore.signupState.isError) {
                              showErrorMessage(context, _authStore.signupState.errorMessage);
                            }
                          },
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

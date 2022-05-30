import 'package:flutter/material.dart';

import 'package:proyect_test/pages/splashes/splash_view_register.dart';
import 'package:proyect_test/services/sessions.dart';
import 'package:proyect_test/styles/register_style.dart';
import 'package:proyect_test/widgets/alert_dialog.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.of(context).size;
    final width = sizes.width;
    final height = sizes.height;

    return Scaffold(
      body: CustomPaint(
        painter: SplashCanvasRegister(height: height, width: width),
        child: const SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: MainWidget(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.pop(context, 'singIn');
        },
        backgroundColor: Colors.transparent,
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.of(context).size;
    final TextStyle styleLabel =
        TextStyle(fontWeight: FontWeight.w800, fontSize: sizes.width * 0.06);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: sizes.height * 0.1),
          child: Text("Sing up", style: styleLabel),
        ),
        SingUpForm(sizes: sizes),
      ],
    );
  }
}

class SingUpForm extends StatefulWidget {
  final Size sizes;
  const SingUpForm({
    Key? key,
    required this.sizes,
  }) : super(key: key);

  @override
  State<SingUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<SingUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  String password = "";
  String phone = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    var style = RegisterStyle();
    var session = Sessions();

    double width = widget.sizes.width;

    double height = widget.sizes.height;

    double paddingFieldsSizeWidth = width * 0.05;
    double paddingFieldsSizeHeigth = width * 0.02;

    OutlineInputBorder fieldRadious = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    );

    EdgeInsets paddingEdge = EdgeInsets.only(
        left: paddingFieldsSizeWidth,
        right: paddingFieldsSizeWidth,
        top: paddingFieldsSizeHeigth,
        bottom: paddingFieldsSizeHeigth);

    BorderSide defaultBorderField =
        const BorderSide(color: Colors.blue, width: 2.0);

    BorderRadius borderField = BorderRadius.circular(25);

    double fieldheigth = height * 0.12;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: paddingEdge,
            child: SizedBox(
              height: fieldheigth,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: style.formUserStyle,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains("@") ||
                      !value.endsWith('.com')) {
                    return 'Please enter a correct email';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: paddingEdge,
            child: SizedBox(
              height: fieldheigth,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: _isObscure,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: borderField,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderField,
                    borderSide: defaultBorderField,
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  border: fieldRadious,
                  hintText: 'Enter the password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return 'The password must contain at least 8 characters';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: paddingEdge,
            child: SizedBox(
              height: fieldheigth,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    phone = value;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: style.formPhoneStyle,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 10) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.01),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[500],
                onPrimary: Colors.white,
                shadowColor: Colors.blue[400],
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(width * 0.85, height * 0.07),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var response =
                      await session.getSignUP(email, password, phone);
                  if (response == "0") {
                    showDialog<void>(
                      context: context,
                      builder: (_) => const AlertWidget(
                        mensaje: "Can't create the user",
                      ),
                    );
                  } else {
                    showDialog<void>(
                        context: context,
                        builder: (_) => const AlertWidget(
                              mensaje: "Created correctly",
                            ));
                  }
                }
              },
              child: const Text(
                'SING IN',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

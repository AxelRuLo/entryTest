import 'package:flutter/material.dart';

import 'package:proyect_test/pages/splashes/splash_view_register.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomPaint(
        painter: SplashCanvasRegister(),
        child: SafeArea(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
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
  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: borderField,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderField,
                    borderSide: defaultBorderField,
                  ),
                  prefixIcon: const Icon(
                    Icons.people,
                    color: Colors.blue,
                  ),
                  border: fieldRadious,
                  hintText: 'Enter your email',
                ),
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
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: borderField,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderField,
                    borderSide: defaultBorderField,
                  ),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.blue,
                  ),
                  border: fieldRadious,
                  hintText: 'Enter the password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return 'Please enter a valid  password';
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: borderField,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderField,
                    borderSide: defaultBorderField,
                  ),
                  prefixIcon: const Icon(
                    Icons.phone_android,
                    color: Colors.blue,
                  ),
                  border: fieldRadious,
                  hintText: 'Enter the phone',
                ),
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Processing Data'),
                    ),
                  );
                }
              },
              child: const Text(
                'LOG IN',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

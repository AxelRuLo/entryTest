import 'package:flutter/material.dart';
import 'package:proyect_test/pages/splashes/splash_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomPaint(
        painter: SplashCanvas(),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: MainContent(),
            ),
          ),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
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
          child: Text("Sign in", style: styleLabel),
        ),
        LoginForm(sizes: sizes),
        const RegisterButton()
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  final Size sizes;
  const LoginForm({
    Key? key,
    required this.sizes,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
                  hintText: 'Enter user',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the user';
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
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
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

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "¿Don't have an account yet?",
            style: TextStyle(fontSize: 17),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'singIn');
            },
            child: const Text(
              'Join us',
              style: TextStyle(color: Color.fromARGB(255, 91, 81, 240), fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

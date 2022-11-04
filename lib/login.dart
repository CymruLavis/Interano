import 'package:flutter/material.dart';
import 'package:test/sign_up.dart';
import 'colourSwatch.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String _title = 'Ronnect Login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: const Color.fromRGBO(75, 113, 210, 1),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  bool remberMe = false;
  bool isChecked = false;
  final primaryColour = Colours();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return primaryColour.getPrimarySwatch();
    }

    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Ronnect Login',
                  style: TextStyle(
                      color: Color.fromRGBO(75, 113, 210, 1),
                      //It would be great to get this color working with the function
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Image.asset('images/Logo.jpg', height: 200, width: 200)),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: userName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              style: TextButton.styleFrom(
                  foregroundColor: primaryColour.getPrimarySwatch()),
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColour.getPrimarySwatch()),
                  child: const Text('Login'),
                  onPressed: () {},
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Remember me'),
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Don\'t have saccount?',
                    style: TextStyle(fontSize: 14)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: primaryColour.getPrimarySwatch()),
                  child: const Text(
                    'Sign up',
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

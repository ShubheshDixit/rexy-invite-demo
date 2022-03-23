import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rexy_invite_demo/pages/Home/home_page.dart';
import 'package:rexy_invite_demo/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? countryCode = '';
  var maskFormatter = MaskTextInputFormatter(
    mask: '+## ##########',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  Future<void> signInGoogle() async {
    try {
      UserCredential credential = await AuthService().signInWithGoogle();
      if (credential.user != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const Home(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error signing in!"),
          ),
        );
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error signing in!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              const Text(
                'Please provide your number',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  prefixIcon: CountryCodePicker(
                    showDropDownButton: true,
                    padding: const EdgeInsets.only(left: 40.0),
                    initialSelection: 'IN',
                    showFlagMain: false,
                    backgroundColor: Colors.grey.shade800,
                    dialogBackgroundColor: Colors.grey.shade800,
                    onChanged: (value) {
                      setState(() {
                        countryCode = value.dialCode;
                      });
                    },
                  ),
                  hintText: 'Add Invite Code',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Text(
                'We will send an OTP to verify this number',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 21),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(),
              Row(
                children: [
                  const Expanded(
                      child: Divider(
                    endIndent: 10,
                    thickness: 1,
                  )),
                  Text(
                    'Or',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                  ),
                  const Expanded(
                      child: Divider(
                    indent: 10,
                    thickness: 1,
                  )),
                ],
              ),
              OutlinedButton(
                  onPressed: signInGoogle,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(16.0),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(FontAwesomeIcons.google),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 18,
                        ),
                      )
                    ],
                  )),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

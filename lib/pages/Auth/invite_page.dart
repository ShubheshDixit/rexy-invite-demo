import 'package:flutter/material.dart';
import 'package:rexy_invite_demo/pages/Auth/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({Key? key}) : super(key: key);

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  color: Colors.red.shade400,
                  child: const Center(
                    child: Text(
                      'Invalid code. Please try agian',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Continue with Invite Code',
                        style: TextStyle(color: Colors.white, fontSize: 21),
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
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
                      Column(
                        children: [
                          const Text(
                            'No invite code?',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () async {
                              if (await canLaunch(
                                  'https://docs.google.com/forms/d/e/1FAIpQLSf-cG74FiA2mkPYXezmIlYDZpdG5n84c4Rt9uZcF1dxvAHk1Q/viewform')) {
                                await launch(
                                    'https://docs.google.com/forms/d/e/1FAIpQLSf-cG74FiA2mkPYXezmIlYDZpdG5n84c4Rt9uZcF1dxvAHk1Q/viewform');
                              }
                            },
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(color: Colors.grey.shade400),
                                children: const [
                                  TextSpan(
                                    text:
                                        'If you want an invite code and get early access, please fill out ',
                                  ),
                                  TextSpan(
                                    text: 'this form',
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

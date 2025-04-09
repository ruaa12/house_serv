import 'package:flutter/material.dart';
import 'package:home_serviece/feature/auth/presentation/screen/login_screen.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_user.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_worker.dart';
import 'package:home_serviece/feature/auth/presentation/widget/container_iam.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class IamLookingFor extends StatelessWidget {
  static String id = 'iamlookingfor';
  const IamLookingFor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              'I am ',
              style: TextStyle(
                fontSize: 45,
                color: color6,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            ContainerIam(
              label: 'Service Provider',
              text: 'I offer professional services.',
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupWorker(),
                    ));
              },
            ),
            const SizedBox(
              height: 80,
            ),
            ContainerIam(
              label: 'Looking for service',
              text: 'I am looking for home services.',
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupUser(),
                    ));
              },
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'already have an account?',
                  style: TextStyle(fontSize: 18, color: color2),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: const Text(
                      'LogIn',
                      style: TextStyle(fontSize: 16, color: color4),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

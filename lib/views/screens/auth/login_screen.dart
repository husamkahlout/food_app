
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_api/providers/auth_provider.dart';
import 'package:food_api/router/router.dart';
import 'package:food_api/views/screens/auth/signup_screen.dart';
import 'package:food_api/views/theme/theme.dart';
import 'package:food_api/views/widgets/already_have_an_account_acheck.dart';
import 'package:food_api/views/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: MobileLoginScreen(),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              // Text(
              //   "LOGIN",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 50),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 30,
                    child: SvgPicture.asset("assets/icons/Mobile-login.svg",
                    height: 250,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: defaultPadding * 2),
            ],
          ), 
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 8,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: provider.loginKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          customHintText: "Your Email",
                          isSecure: false,
                          textFieldValidator: provider.emailValidation,
                          textFieldController: provider.emailController,
                          prefixIcon: const Icon(Icons.person),
                          textInputType: TextInputType.emailAddress),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: CustomTextField(
                            customHintText: "Your Password",
                            textFieldValidator: provider.passwordValidation,
                            textFieldController: provider.passwordController,
                            prefixIcon: const Icon(Icons.lock),
                            textInputType: TextInputType.text,
                            isSecure: true),
                      ),
                      const SizedBox(height: defaultPadding),
                      Hero(
                        tag: "login_btn",
                        child: ElevatedButton(
                          onPressed: () {
                            provider.signIn();
                            // Provider.of<FirestoreProvider>(context, listen: false).getUser();
                          },
                          child: Text(
                            "Login".toUpperCase(),
                          ),
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      AlreadyHaveAnAccountCheck(
                        press: () {
                          AppRouter.navigateWithReplacementToWidget(
                              SignUpScreen());
                              
                        },
                        reset: () {
                          provider.forgetPassword();
                        },
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      );
    });
  }
}

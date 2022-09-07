import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_api/providers/auth_provider.dart';
import 'package:food_api/router/router.dart';
import 'package:food_api/views/screens/auth/login_screen.dart';
import 'package:food_api/views/theme/theme.dart';
import 'package:food_api/views/widgets/already_have_an_account_acheck.dart';
import 'package:food_api/views/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: MobileSignupScreen(),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, x) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              // Text(
              //   "Sign Up".toUpperCase(),
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 80),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 50,
                    child: SvgPicture.asset("assets/icons/signup.svg",
                    height: 200,),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: defaultPadding),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 8,
                child: Form(
                  key: authProvider.signUpKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      CustomTextField(
                        customHintText: "Your Email",
                        textFieldValidator: authProvider.emailValidation,
                        textFieldController: authProvider.emailController,
                        prefixIcon: Icon(Icons.email_rounded),
                        textInputType: TextInputType.emailAddress,
                        isSecure: false,
                      ),Padding(
                            padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: CustomTextField(
                          customHintText: "Your password",
                          textFieldValidator: authProvider.passwordValidation,
                          textFieldController: authProvider.passwordController,
                          prefixIcon: Icon(Icons.lock),
                          textInputType: TextInputType.text,
                          isSecure: true,
                        ),
                      ),
                      const SizedBox(height: defaultPadding * 1.5),
                      ElevatedButton(
                        onPressed: () {
                          authProvider.signUp();
                          // Provider.of<FirestoreProvider>(context, listen: false).addNewUser();
                        },
                        child: Text("Sign Up".toUpperCase()),
                      ),
                      const SizedBox(height: defaultPadding),
                      AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () {
                          AppRouter.navigateWithReplacementToWidget(
                              LoginScreen());
                        },
                      ),
                      const SizedBox(height: 150),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      );
    });
  }
}

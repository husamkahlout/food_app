
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_api/router/router.dart';
import 'package:food_api/views/screens/home/home_page.dart';
import 'package:food_api/views/screens/auth/login_screen.dart';
import 'package:food_api/views/widgets/custom_dialog.dart';


class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
  Future<UserCredential?> signIn(String emailAddress, String password) async {
    try {
      final credential = await firebaseAuthInstance.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialog.showDialogFunction('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomDialog.showDialogFunction(
            'Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential?> signUp(String emailAddress, String password) async {
    try {
      final credential =
          await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // weak password = less than 6 letters
        CustomDialog.showDialogFunction('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomDialog.showDialogFunction(
            'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  verifyEmail() {
    User? user = firebaseAuthInstance.currentUser;
    user?.sendEmailVerification();
    CustomDialog.showDialogFunction(
        'Follow this link to verify your email address.');
  }

  checkUser() async {
    User? user = firebaseAuthInstance.currentUser;
    if (user == null) {
      // if there is no user signed in
      AppRouter.navigateWithReplacementToWidget(LoginScreen());
      // } else if (!user.emailVerified) {
      //   AppRouter.NavigateWithReplacementToWidget(LoginScreen());
      //   CustomDialog.showDialogFunction(
      //         'The account you recently logged in is not verified!');
    } else {
      AppRouter.navigateWithReplacementToWidget(HomePage());
      // CustomDialog.showDialogFunction('Welcome');
    }
  }

  signOut() async {
    await firebaseAuthInstance.signOut();
    AppRouter.navigateWithReplacementToWidget(LoginScreen());
  }

  forgetPassword(String email) async {
    try {
      await firebaseAuthInstance.sendPasswordResetEmail(email: email);
      CustomDialog.showDialogFunction(
          'confirmation email has been sent, please check your email');
    } on Exception catch (e) {}
  }
}
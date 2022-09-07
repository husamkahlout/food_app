import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_api/providers/auth_provider.dart';
import 'package:food_api/router/router.dart';
import 'package:food_api/views/screens/auth/login_screen.dart';
import 'package:food_api/views/theme/theme.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  navigateFunction() async {
    await Future.delayed(const Duration(seconds: 5));
     Provider.of<AuthProvider>(AppRouter.navKey.currentContext!, listen: false)
        .checkUser();
  }

  @override
  Widget build(BuildContext context) {
    navigateFunction();
    return  Scaffold(
      body:  Center(
      child: Image.asset(
            "assets/images/restaurant.png",
          ),
    ),
    );
  }
}


  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Center(
  //         child: Row(
  //           children: [
  //             const Spacer(),
  //             Expanded(
  //               flex: 25,
  //               child: Image.asset(
  //                 "assets/images/restaurant.png"
  //               ),
  //               // child: SvgPicture.asset(
  //               //   "assets/icons/2.svg",
  //               //   theme: SvgTheme(currentColor: kPrimaryColor) ,

  //               // ),
  //             ),
  //             const Spacer(),
  //           ],
  //         ),
  //       ),
  //       // Row(
  //       //   children: [
  //       //     const Spacer(),
  //       //     Expanded(
  //       //       flex: 8,
  //       //       child: Column(
  //       //         children: [
  //       //           Hero(
  //       //             tag: "admin_btn",
  //       //             child: ElevatedButton(
  //       //               onPressed: () {
  //       //                 Navigator.push(
  //       //                   context,
  //       //                   MaterialPageRoute(
  //       //                     builder: (context) {
  //       //                       return CategoriesScreen();
  //       //                     },
  //       //                   ),
  //       //                 );
  //       //               },
  //       //               child:  Text(
  //       //                 "Admin".toUpperCase(),
  //       //               ),
  //       //             ),
  //       //           ),
  //       //           const SizedBox(height: 16),
  //       //           ElevatedButton(
  //       //             onPressed: () {
  //       //               Navigator.push(
  //       //                 context,
  //       //                 MaterialPageRoute(
  //       //                   builder: (context) {
  //       //                     return UserCategories();
  //       //                   },
  //       //                 ),
  //       //               );
  //       //             },
  //       //             style: ElevatedButton.styleFrom(
  //       //                 primary: kPrimaryLightColor, elevation: 0),
  //       //             child: Text(
  //       //               "User".toUpperCase(),
  //       //               style: TextStyle(color: Colors.black),
  //       //             ),
  //       //           ),
  //       //           const SizedBox(height: 30),
  //       //         ],
  //       //       ),
  //       //     ),
  //       //     Spacer(),
  //       //   ],
  //       // ),
  //     ],
  //   );
  // }


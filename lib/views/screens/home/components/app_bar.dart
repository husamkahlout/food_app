import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_api/providers/auth_provider.dart';
import 'package:food_api/router/router.dart';
import 'package:food_api/views/screens/home/all_meals.dart';
import 'package:food_api/views/screens/search/search_screen.dart';
import 'package:food_api/views/theme/theme.dart';
import 'package:provider/provider.dart';

AppBar HomeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {
        Provider.of<AuthProvider>(context, listen: false).signOut();
      },
    ),
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.bold, fontFamily: "Poppins"),
        children: const [
          TextSpan(
            text: "Good",
            style: TextStyle(
                color: ksecondaryColor, fontSize: 18, letterSpacing: 1),
          ),
          TextSpan(
            text: "Food",
            style:
                TextStyle(color: kPrimaryColor, fontSize: 18, letterSpacing: 1),
          ),
        ],
      ),
    ),
    centerTitle: true,
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/search.svg"),
        onPressed: () {
          AppRouter.navigateToWidget(SearchScreen());
        },
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:food_api/router/router.dart';
import 'package:food_api/views/theme/theme.dart';

class CustomDialog {
 static showDialogFunction(String content){
       showDialog(
            context: AppRouter.navKey.currentContext!,
            builder: (context) => AlertDialog(
                  content: Text(content),
                  actions: [
                    TextButton(
                        onPressed: () {
                          AppRouter.popRouter();
                        },
                        child: const Text("OK", style: TextStyle(color: kPrimaryColor,fontSize: 19)))
                  ],
                ));
  }
}
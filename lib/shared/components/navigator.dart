import 'package:flutter/material.dart';

import '../network/local/shared_preferences.dart';

navigateTo( context,screen) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

navigateAndReplace( context,screen) =>
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => screen));

navigateAndFinished( context,screen) =>
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => screen),(route) => false);


void signout(context) {
  CacheHelper.removeToken(key: 'token').then((value) {
  //  navigateAndFinished(context, LoginScreen());
  });
}
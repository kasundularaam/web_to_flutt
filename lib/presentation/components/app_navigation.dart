import 'package:flutter/material.dart';

navAndClear(
        {required BuildContext context, required String route, dynamic args}) =>
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false,
        arguments: args);

navPush({required BuildContext context, required String route, dynamic args}) =>
    Navigator.pushNamed(context, route, arguments: args);

navPop({required BuildContext context}) => Navigator.pop(context);

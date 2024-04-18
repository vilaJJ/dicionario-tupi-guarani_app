import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dicionário Tupi',
    );
  }
}
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/placeholder_controller.dart';

class PlaceholderView extends GetView<PlaceholderController> {

  final String title;

  const PlaceholderView(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlaceholderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PlaceholderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

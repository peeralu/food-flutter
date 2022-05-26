import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'testest_controller.dart';

class TestestView extends GetView<TestestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestestView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TestestView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

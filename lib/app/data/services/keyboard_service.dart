import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyboardService {
  static void hide() {
    final _context = Get.context;
    if (_context != null) {
      FocusScope.of(_context).requestFocus(FocusNode());
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static void focus(FocusNode _focusNode) {
    final _context = Get.context;
    if (_context != null) {
      FocusScope.of(_context).requestFocus(_focusNode);
    }
  }

  static void unfocus() {
    final _context = Get.context;
    if (_context != null) {
      FocusScope.of(_context).unfocus();
    }
  }
}

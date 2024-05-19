import 'package:flutter/material.dart';

void printWarning(String text) {
  debugPrint('\x1B[33m$text\x1B[0m');
}

void printError(String text) {
  debugPrint('\x1B[31m$text\x1B[0m');
}

void printInfo(String text) {
  debugPrint('\x1B[34m$text\x1B[0m');
}

void printSuccess(String text) {
  debugPrint('\x1B[32m$text\x1B[0m');
}

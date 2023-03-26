import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Log {
  void printJson({@required Map? json}) {
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(json);
    print('LOGGIN: $prettyprint');
  }

  void printLog(String str) {
    print('LOGGIN: $str');
  }
}

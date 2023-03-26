import 'package:flutter/material.dart';
import 'package:mvvm_baoflutter_flutter/data_sources/api_services.dart';

import '../models/user.dart';

class UserListViewModel with ChangeNotifier {
  List<User> userList = [];

  fetchUserList() async {
    userList = await ApiServices().fetchUser();
    notifyListeners();
  }
}

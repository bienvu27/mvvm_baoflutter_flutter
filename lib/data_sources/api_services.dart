import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_baoflutter_flutter/data_sources/api_urls.dart';
import 'package:mvvm_baoflutter_flutter/models/user.dart';

import '../resources/utils/fetch_date_exception.dart';

class ApiServices {
  Future<List<User>> fetchUser() {
    return http.get(ApiUrls().API_USER_LIST).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;
      if (statusCode != 200) {
        print(response.reasonPhrase);
        throw FetchDataException(
            'StatusCode:$statusCode, Error:${response.reasonPhrase}');
      }
      final JsonDecoder decoder = JsonDecoder();
      final userListContainer = decoder.convert(jsonBody);
      final List userList = userListContainer['results'];
      return userList.map((e) => User.fromJson(e)).toList();
    });
  }
}

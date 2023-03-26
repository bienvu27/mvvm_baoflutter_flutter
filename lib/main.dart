import 'package:flutter/material.dart';
import 'package:mvvm_baoflutter_flutter/view_models/user_list_view_model.dart';
import 'package:mvvm_baoflutter_flutter/views/user_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserListViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserListScreen(),
      ),
    );
  }
}

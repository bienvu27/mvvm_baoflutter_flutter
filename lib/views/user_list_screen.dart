import 'package:flutter/material.dart';
import 'package:mvvm_baoflutter_flutter/models/user.dart';
import 'package:mvvm_baoflutter_flutter/view_models/user_list_view_model.dart';
import 'package:provider/provider.dart';

import '../resources/strings.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserListViewModel>(context, listen: false).fetchUserList();
  }

  @override
  Widget build(BuildContext context) {
    final userListOnProvider = Provider.of<UserListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(USER_LIST),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: userListOnProvider.userList.isNotEmpty
            ? ListView.builder(
                itemCount: userListOnProvider.userList.length,
                itemBuilder: (context, index) {
                  return UserItem(
                    user: userListOnProvider.userList[index],
                  );
                })
            : const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  User? user;

  UserItem({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user!.picture!.medium!),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user!.name!.first! + '' + user!.name!.last!,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  user!.email!,
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

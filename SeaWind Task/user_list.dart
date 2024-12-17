import 'package:flutter/material.dart';
import 'package:seawindtask/api_service.dart';
import 'package:seawindtask/individual_user.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List _Users = [];

  bool isLoading = false;

  void getData() async {
    var data = await ApiService().getData();

    // print('=-==-=--=-==-${data['data']}');
    setState(() {
      _Users = data['data'];
      isLoading = false;
    });
  }

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get API Data"),
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _Users.length,
              itemBuilder: (context, index) {
                final user = _Users[index];
                return ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                IndividualUser(userID: user['id']),
                          ));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user['avatar'].toString()),
                    ),
                  ),
                  title: Text(
                    user['first_name'].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    user['email'].toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
    );
  }
}

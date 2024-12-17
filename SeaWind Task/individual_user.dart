import 'package:flutter/material.dart';
import 'package:seawindtask/api_service.dart';

class IndividualUser extends StatefulWidget {
  int userID;
  IndividualUser({super.key, required this.userID});

  @override
  State<IndividualUser> createState() => _IndividualUserState();
}

class _IndividualUserState extends State<IndividualUser> {
  Map<String, dynamic> _user = {};
  bool isLoading = false;

  void getUserData() async {
    var data = await ApiService().getUserData(widget.userID);

    // print('=-==-=--=-==-${data['data']}');
    setState(() {
      _user = data['data'];
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
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
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  SizedBox(
                    height: 300,
                    width: MediaQuery.sizeOf(context).width,
                    child: Image.network(
                      _user['avatar'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[100]),
                      child: Center(
                          child: Text(
                        "First Name :  ${_user['first_name']}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[100]),
                      child: Center(
                          child: Text(
                        "Last Name :  ${_user['last_name']}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[100]),
                      child: Center(
                          child: Text(
                        "Email :  ${_user['email']}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))),
                ],
              ),
            ),
    );
  }
}

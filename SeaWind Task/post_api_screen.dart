import 'package:flutter/material.dart';
import 'package:seawindtask/api_service.dart';

class PostApiScreen extends StatefulWidget {
  const PostApiScreen({super.key});

  @override
  State<PostApiScreen> createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _jobController = TextEditingController();

  bool isLoading = false;

  void postData() async {
    var res =
        await ApiService().postData(_nameController.text, _jobController.text);
    setState(() {
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Data Successfully sent...   Your ID:- ${res['id']}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    });
    _nameController.clear();
    _jobController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Data"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          spacing: 10,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: 'Enter name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
            ),
            TextField(
              controller: _jobController,
              decoration: InputDecoration(
                labelText: "Job",
                hintText: 'Enter job',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  postData();
                },
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Text("Send")),
          ],
        ),
      ),
    );
  }
}

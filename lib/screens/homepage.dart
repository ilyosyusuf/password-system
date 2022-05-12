import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getstoragesmall/screens/secondpage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _controller,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                if (GetStorage().read("pin") == null) {
                  await GetStorage().write("pin", _controller.text);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage()),
                      (route) => false);
                } else {
                  
                    GetStorage().read("pin") == _controller.text
                        ? Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondPage()),
                            (route) => false)
                        : count+=1;

                }
                if (count == 3) {
                  print("3 martta");
                }
              },
              child: Text("Press"))
        ],
      ),
    );
  }
}

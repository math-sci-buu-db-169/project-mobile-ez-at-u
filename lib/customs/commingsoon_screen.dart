import 'package:flutter/material.dart';

class CommingSoonScreen extends StatefulWidget {
  const CommingSoonScreen({Key? key}) : super(key: key);

  @override
  State<CommingSoonScreen> createState() => _CommingSoonScreenState();
}

class _CommingSoonScreenState extends State<CommingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            const Text(
              "COMMING",
              style: TextStyle(color: Colors.red,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "SOON",

              style: TextStyle(color: Colors.red,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "   No information found  \nin the current database.",

                style: TextStyle(color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(
                Icons.arrow_back,color: Colors.grey,
              ),

              ),
            )
          ],
        ),

      ),
    );
  }
}

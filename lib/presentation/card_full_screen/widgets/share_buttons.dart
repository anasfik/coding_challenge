import 'package:flutter/material.dart';

class ShareButtons extends StatelessWidget {
  const ShareButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text("شارك"),
                    Icon(Icons.facebook),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text("شارك"),
                    Icon(Icons.facebook),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

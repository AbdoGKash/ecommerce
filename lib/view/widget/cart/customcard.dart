import 'package:flutter/material.dart';

class CoustomCard extends StatelessWidget {
  final String name;
  final String count;
  final String image;
  const CoustomCard(
      {super.key,
      required this.name,
      required this.count,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(image))),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(
                name,
                style: const TextStyle(fontFamily: "", fontSize: 15),
              ),
            ),
          ),
          // Expanded(
          //   child: Column(
          //     children: [
          //       IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          //       Text(
          //         count,
          //         style: const TextStyle(fontFamily: ""),
          //       ),
          //       IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

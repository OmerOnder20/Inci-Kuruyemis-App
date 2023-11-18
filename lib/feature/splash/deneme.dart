import 'package:flutter/material.dart';

class TraingingView extends StatelessWidget {
  const TraingingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Count"),
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Expanded(
              child: Container(
            height: MediaQuery.sizeOf(context).height * 0.3,
          ))
        ]),
      ),
    );
  }
}

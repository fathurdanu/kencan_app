import 'package:flutter/material.dart';

class DocumentPaper extends StatelessWidget {
  const DocumentPaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}

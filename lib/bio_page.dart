import 'package:flutter/material.dart';
import 'package:kencan_app/model/account.dart';

class BioPage extends StatelessWidget {
  final Account person;

  const BioPage({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          const DocumentPaper(),
          Column(
            children: [
              Expanded(
                flex: 2,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxHeight <= 180 &&
                        constraints.maxHeight > 120) {
                      return horizontalMode();
                    } else if (constraints.maxHeight <= 120) {
                      return const Text("");
                    } else {
                      return verticalMode();
                    }
                  },
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: DefaultTextStyle(
                    child: ListView(
                      children: [
                        deviderDash("Bio"),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            person.bio,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(height: 10),
                        deviderDash("Hobby"),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(person.hobby),
                        ),
                        const SizedBox(height: 10),
                        deviderDash("Skill"),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(person.skill),
                        ),
                        const SizedBox(height: 10),
                        deviderDash("Favourite Food"),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(person.favFood),
                        ),
                      ],
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Padding verticalMode() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[300],
              radius: 45,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(person.profilePic),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              person.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "${person.job} | ${person.age.toString()} | ${person.location}")
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding horizontalMode() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[300],
              radius: 45,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(person.profilePic),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              person.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(width: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "${person.job} | ${person.age.toString()} | ${person.location}")
              ],
            )
          ],
        ),
      ),
    );
  }

  Row deviderDash(String text) {
    return Row(children: <Widget>[
      const Expanded(
          flex: 15,
          child: Divider(
            color: Colors.white,
            thickness: 2,
          )),
      const SizedBox(width: 5),
      Text(text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
    ]);
  }
}

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

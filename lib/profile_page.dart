import 'package:flutter/material.dart';
import 'package:kencan_app/bio_page.dart';
import 'package:kencan_app/model/account.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  double getWidthScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getHeightScreen(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

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
                child: Builder(
                  builder: (context) {
                    if (getHeightScreen(context) > 455 &&
                        getWidthScreen(context) >= 480) {
                      return horizontalMode();
                    } else if (getHeightScreen(context) > 651 &&
                        getWidthScreen(context) < 480 &&
                        getWidthScreen(context) > 350) {
                      return verticalMode();
                    } else {
                      return const Text("");
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
                            myAccount.bio,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(height: 10),
                        deviderDash("Hobby"),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(myAccount.hobby),
                        ),
                        const SizedBox(height: 10),
                        deviderDash("Skill"),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(myAccount.skill),
                        ),
                        const SizedBox(height: 10),
                        deviderDash("Favourite Food"),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(myAccount.favFood),
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
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[300],
                radius: 45,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(myAccount.profilePic),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                myAccount.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                  "${myAccount.job} | ${myAccount.age.toString()} | ${myAccount.location}")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Match",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "15",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Rejected",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "87",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding horizontalMode() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Center(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    radius: 45,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(myAccount.profilePic),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                myAccount.name,
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
                      "${myAccount.job} | ${myAccount.age.toString()} | ${myAccount.location}")
                ],
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Match",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "15",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Rejected",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "87",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
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

import 'package:flutter/material.dart';
import 'package:kencan_app/bio_page.dart';
import 'package:kencan_app/model/account.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const AccountGrid();
  }
}

class AccountGrid extends StatelessWidget {
  const AccountGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.blue[100],
      child: GridView.count(
        crossAxisCount: 3,
        children: accountList.map((account) {
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BioPage(person: account);
                }));
              },
              child: Card(
                child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        account.profilePic,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text(
                                  account.name,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ));
        }).toList(),
      ),
    );
  }
}

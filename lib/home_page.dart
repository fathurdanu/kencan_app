import 'package:flutter/material.dart';
import 'package:kencan_app/bio_page.dart';
import 'package:kencan_app/model/account.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccountGrid();
  }
}

class AccountGrid extends StatelessWidget {
  const AccountGrid({Key? key}) : super(key: key);

  double _getWidthScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  int _getGridCount(context) {
    if (_getWidthScreen(context) < 250 && _getWidthScreen(context) >= 91) {
      return 1;
    } else if (_getWidthScreen(context) < 1000 &&
        _getWidthScreen(context) > 250) {
      return 3;
    } else {
      return 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.blue[100],
      child: Builder(builder: (context) {
        return personGridView(context, _getGridCount(context));
      }),
    );
  }

  GridView personGridView(BuildContext context, int gridCount) {
    return GridView.count(
      crossAxisCount: gridCount,
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
    );
  }
}

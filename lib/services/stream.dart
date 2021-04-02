import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/users.dart';
import 'package:store/pages/firtsPage.dart';
import 'package:store/pages/screen/buttonPageView.dart';
import 'package:store/services/authacation.dart';

class StreamAuthControl extends StatefulWidget {
  @override
  _StreamAuthControlState createState() => _StreamAuthControlState();
}

class _StreamAuthControlState extends State<StreamAuthControl> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Authacation>(context, listen: false);
    return StreamBuilder<Object>(
        stream: provider.controlChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }
          if (snapshot.hasData) {
            Users activeUser = snapshot.data;
            provider.activeUserId = activeUser.id;
            return ButtonPageView();
          } else {
            return FirtsPage();
          }
        });
  }
}

import 'package:flutter/material.dart';
import 'package:store/style/color.dart';
import 'package:store/style/textStyle.dart';

class PersonPageAltSettings extends StatefulWidget {
  String title;
  int notification;

  PersonPageAltSettings({
    this.notification,
    this.title,
  });

  @override
  _PersonPageAltSettingsState createState() => _PersonPageAltSettingsState();
}

class _PersonPageAltSettingsState extends State<PersonPageAltSettings> {
  bool isNotification = false;

  void notifController() {
    if (this.widget.notification == 0) {
      setState(() {
        this.isNotification = false;
      });
    } else {
      setState(() {
        this.isNotification = true;
      });
    }
  }

  @override
  void initState() {
    notifController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: roboto(
                context,
                21,
                darkColor,
                FontWeight.w700,
              ),
            ),
            isNotification
                ? Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: greyColor.withOpacity(0.3),
                    ),
                    child: Text(
                      widget.notification.toString(),
                      style: popiens(
                        context,
                        16,
                        blackGreyColor,
                        FontWeight.w500,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

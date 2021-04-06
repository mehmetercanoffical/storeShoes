import 'package:flutter/material.dart';
import 'package:store/models/users.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';

class UserWdiget extends StatelessWidget {
  const UserWdiget({
    Key key,
    @required this.user,
  }) : super(key: key);

  final Users user;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: user.photoImg.isNotEmpty
                  ? NetworkImage(user.photoImg)
                  : AssetImage("assets/img/shoes1.png"),
            ),
          ),
        ),
        swidth20,
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.userName,
              style: popiens(
                context,
                19,
                darkColor,
                FontWeight.bold,
              ),
            ),
            sheight5,
            Text(
              user.email,
              style: popiens(
                context,
                16,
                darkColor.withOpacity(0.8),
                FontWeight.bold,
              ),
            ),
            sheight5,
            InkWell(
              onTap: () {},
              child: Text(
                "Edit Profile",
                style: popiens(
                  context,
                  15,
                  greyColor.withOpacity(0.8),
                  FontWeight.w300,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

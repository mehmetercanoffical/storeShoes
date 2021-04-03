import 'package:flutter/material.dart';
import 'package:store/pages/screen/home.dart';
import 'package:store/pages/screen/person.dart';
import 'package:store/pages/screen/search.dart';
import 'package:store/style/color.dart';
import 'package:store/widget/buttonNavigatorCenter.dart';

class ButtonPageView extends StatefulWidget {
  @override
  _ButtonPageViewState createState() => _ButtonPageViewState();
}

class _ButtonPageViewState extends State<ButtonPageView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: pages.length,
                    itemBuilder: (comtext, index) {
                      return pages[currentIndex];
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                            offset: Offset(0, 2),
                            blurRadius: 20,
                          )
                        ],
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: getList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: greyColor,
                            onTap: () {
                              setState(() {
                                getList[currentIndex].isSelected = false;
                                currentIndex = index;
                                getList[currentIndex].isSelected = true;
                              });
                            },
                            child: ButtonNavigatorCenter(
                              isSelected: getList[index].isSelected,
                              iconData: getList[index].iconData,
                              title: getList[index].title,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> pages = [
  Home(),
  Search(),
  Person(),
];

List<ButtonNavigatorCenter> getList = [
  new ButtonNavigatorCenter(
    iconData: Icons.home,
    title: "Home",
    isSelected: true,
  ),
  new ButtonNavigatorCenter(
    iconData: Icons.search,
    title: "Search",
    isSelected: false,
  ),
  new ButtonNavigatorCenter(
    iconData: Icons.person,
    title: "Person",
    isSelected: false,
  ),
];

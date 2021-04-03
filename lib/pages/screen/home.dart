import 'package:flutter/material.dart';
import 'package:store/pages/screen/home/newStory.dart';
import 'package:store/pages/screen/home/store.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/widget/titleCenter.dart';

List<Widget> pages = [
  NewPopular(),
  Story(),
];

List<TitleCenter> title = [
  TitleCenter(
    isSelected: true,
    title: "News&Story",
  ),
  TitleCenter(
    isSelected: false,
    title: "Story",
  ),
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
              vertical: kPaddingVertical,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: title.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: greyColor,
                        highlightColor: trasparentColor,
                        onTap: () {
                          setState(() {
                            title[currentIndex].isSelected = false;
                            currentIndex = index;
                            title[currentIndex].isSelected = true;
                          });
                        },
                        child: TitleCenter(
                          title: title[index].title,
                          isSelected: title[index].isSelected,
                        ),
                      );
                    },
                  ),
                ),
                sheight10,
                Expanded(
                  child: PageView.builder(
                    itemCount: pages.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return pages[currentIndex];
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

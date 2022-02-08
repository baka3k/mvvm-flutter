import 'package:base_source/app/utils/log.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../components/app_theme.dart';

class RecipeFeed extends GetWidget {
  const RecipeFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        appBar: _buildAppBar(),
        body: _uiRecipe(),
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  _buildAppBar() {
    return AppBar(
      title: _buildIconScratch(),
      backgroundColor: backGroundColor,
      actions: [
        IconButton(
            onPressed: () {
              log("RecipeFeed", mess: "log me");
            },
            icon:
                Image.asset("assets/images/recipe_feed_icon_notification.png")),
        IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/recipe_feed_icon_email.png")),
      ],
    );
  }

  _buildIconScratch() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Image.asset(
          "assets/images/scratch_logo.png",
          width: constraints.maxWidth * 0.34,
        );
      },
    );
  }

  _buildBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      selectedItemColor: canvasColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: backGroundColor,
      currentIndex: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/images/recipe_bottom_icon1.png")),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/images/recipe_bottom_icon2.png")),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/images/recipe_bottom_icon3.png")),
          label: 'School',
        ),
      ],
    );
  }

  _uiRecipe() {
    final PageController controller = PageController(
      viewportFraction: 0.8
    );
    return PageView.builder(
        itemCount: 10,
        controller: controller,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        });
  }

  _buildPageItem(int position) {
    return LayoutBuilder(builder: (context, constrains) {
      return Column(
        children: [
          _profileUI(constrains.maxWidth),
          // Flexible(child: Image.asset("assets/images/test_page.png")),
          Expanded(child: Image.asset("assets/images/test_page.png", fit: BoxFit.fill,)),
          _informationUI(constrains.maxWidth)
        ],
      );
    });
    // AnimatedContainer(
    //   duration: const Duration(milliseconds: 200),
    //   child: _buildPageItem(position),
    // )
  }

  _profileUI(maxWidth) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0),
          child: Image.asset(
            "assets/images/test_avatar.png",
            width: maxWidth * 0.08,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 2),
              child: Text(
                "Profile name",
                style: textStyleApp.copyWith(
                    fontSize: 11,
                    color: const Color.fromARGB(255, 5, 15, 9),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 2),
              child: Text(
                "2h ago",
                style: textStyleApp.copyWith(
                    fontSize: 11,
                    color: const Color.fromARGB(255, 118, 118, 118)),
              ),
            ),
          ],
        )
      ],
    );
  }

  _informationUI(maxWidth) {
    log("_informationUI", mess: "maxWidth $maxWidth");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Red Wine and Mint Soufflé ",
              style: textStyleApp.copyWith(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 3, 15, 9),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: maxWidth * 0.1,
              height: maxWidth * 0.1,
              child: IconButton(
                  onPressed: () {},
                  icon:
                      Image.asset("assets/images/recipe_feed_icon_like.png"))),
        )
      ],
    );
    return Text("dwadwda");
  }
}

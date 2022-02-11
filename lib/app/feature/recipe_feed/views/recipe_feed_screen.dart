import 'package:base_source/app/routes/app_routes.dart';
import 'package:base_source/app/utils/log.dart';
import 'package:base_source/data/recipe/model/recipe_feed_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_error.dart';
import '../../../components/app_theme.dart';
import '../viewmodels/recipe_view_model.dart';

class RecipeFeedScreen extends GetWidget<RecipeViewModel> {
  const RecipeFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        appBar: _buildAppBar(),
        body: _bodyUi(),
        bottomNavigationBar: _uiBottomNavigationBar());
  }

  _buildAppBar() {
    return AppBar(
      title: _uiIconScratch(),
      backgroundColor: backGroundColor,
      actions: [
        IconButton(
            onPressed: () {
              log("RecipeFeed", mess: "log me");
              controller.loadRecipeFeeds();
            },
            icon:
                Image.asset("assets/images/recipe_feed_icon_notification.png")),
        IconButton(
            onPressed: () {
              Get.toNamed(Routes.home);
            },
            icon: Image.asset("assets/images/recipe_feed_icon_email.png")),
      ],
    );
  }

  _bodyUi() {
    return controller.obx(
      (state) => _uiRecipePageView(),
      onEmpty: const Text('No data found'),
      onError: (error) => AppError(
        errortxt: error ?? "",
      ),
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _uiIconScratch() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Image.asset(
          "assets/images/scratch_logo.png",
          width: constraints.maxWidth * 0.34,
        );
      },
    );
  }

  _uiBottomNavigationBar() {
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

  _uiRecipePageView() {
    final PageController pageController =
        PageController(viewportFraction: 0.88);
    return PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: controller.reipeFeeds.length,
        controller: pageController,
        onPageChanged: (currentPage) {
          controller.setCurrentPage(currentPage);
        },
        itemBuilder: (context, position) {
          // int currentPage = controller.currentPage.value;
          RecipeFeedModel recipeFeedModel = controller.reipeFeeds[position];
          return _uiPageItem(position, recipeFeedModel);
        });
  }

  _uiPhotoItem(String? url) {
    log("RecipeFeedScreen", mess: "_buildPhotoItem() url: $url");
    if (url == null || url.isEmpty) {
      return Image.asset(
        "assets/images/test_page.png",
        fit: BoxFit.fill,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          );
        },
        placeholder: (context, url) => const SizedBox(
            width: 60,
            height: 60,
            child: Center(child: CircularProgressIndicator())),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }
  }

  _uiPageItem(int position, RecipeFeedModel recipeFeedModel) {
    return LayoutBuilder(builder: (context, constrains) {
      log("_informationUI", mess: "constrains $constrains");
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: AspectRatio(
                        aspectRatio: 295 / 396,
                        child: _uiPhotoItem(recipeFeedModel.downloadUrl))),
                _uiInformation(constrains.maxWidth),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                  child: Text(
                    "Apparently we had reached a great height in the atmosphere, for the sky was …",
                    style: textStyleApp.copyWith(
                        color: const Color.fromARGB(255, 168, 168, 168),
                        fontSize: 12),
                  ),
                ),
                _uiCommentInfo(),
              ],
            ),
            _uiProfile(constrains.maxWidth, recipeFeedModel),
          ],
        ),
      );
    });
  }

  _uiProfile(maxWidth, RecipeFeedModel recipeFeedModel) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [backGroundColor, backGroundColor.withOpacity(0.3)],
              begin: const Alignment(0, -1),
              end: const Alignment(0, 1))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 0),
            child: Image.asset(
              "assets/images/test_avatar.png",
              width: maxWidth * 0.08,
              height: maxWidth * 0.08,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 8.0, 8.0, 2),
                child: Text(
                  "${recipeFeedModel.author}",
                  style: textStyleApp.copyWith(
                      fontSize: 11,
                      color: const Color.fromARGB(255, 5, 15, 9),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 8),
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
      ),
    );
  }

  _uiInformation(maxWidth) {
    log("_informationUI", mess: "maxWidth $maxWidth");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
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
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
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
  }

  _uiCommentInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
      child: Row(
        children: [
          Text(
            "32 likes ",
            style: textStyleApp.copyWith(
              fontSize: 12,
              color: const Color.fromARGB(255, 96, 96, 96),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
            child: Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 96, 96, 96),
                  shape: BoxShape.circle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
            child: Text(
              "8 Comments ",
              style: textStyleApp.copyWith(
                fontSize: 12,
                color: const Color.fromARGB(255, 96, 96, 96),
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              _gotoSaveScreen();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: mainColor, width: 1),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      size: 13,
                      color: mainColor,
                    ),
                    Text(
                      "Save",
                      style:
                          textStyleApp.copyWith(color: mainColor, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          )
        ],
      ),
    );
  }

  _gotoSaveScreen() {
    Get.toNamed(Routes.home);
  }
}

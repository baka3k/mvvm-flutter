import 'package:base_source/app/components/alert_dialog.dart';
import 'package:base_source/app/components/app_button.dart';
import 'package:base_source/app/components/app_theme.dart';
import 'package:base_source/app/components/dialog_loading.dart';
import 'package:base_source/app/feature/signin/viewmodels/sign_in_view_model.dart';
import 'package:base_source/app/routes/app_routes.dart';
import 'package:base_source/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends GetWidget<SignInViewModel> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _observeScreenState(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: signInBackGroundColor,
          body: _uiSignIn1(),
        ),
      ),
    );
  }

  _observeScreenState(BuildContext context) {
    controller.loading.listen((state) {
      if (state) {
        showLoading();
      } else {
        hideLoading();
      }
    });
    controller.signInViewState.listen((viewState) {
      if (viewState?.isSuccess == true) {
        goToNextScreen();
      } else if (viewState?.isFailure == true) {
        String mess = viewState?.error?.errorResponse ?? "NULL";
        showAlertDialog(
            context: context,
            title: "Sign In Error",
            message: mess,
            onConfirmed: () {},
            onCancel: () {});
      } else {
        print("abnormal case viewState: $viewState");
      }
    });
  }

  _uiSignIn1() {
    return LayoutBuilder(builder: (context, constraints) {
      print("_uiSignIn1 $constraints");
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _welcomeView(constraints.maxWidth, constraints.maxHeight),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Please login to continue.",
                  style: textStyleApp.copyWith(fontSize: 13),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: Obx(() {
                  return TextField(
                    onChanged: controller.onUsernameChanged,
                    style: textStyleApp.copyWith(
                        fontSize: 13,
                        color: const Color.fromARGB(255, 96, 96, 96)),
                    decoration: InputDecoration(
                      errorText: controller.userErrorText.value,
                      labelText:
                          "Email address", //LocaleKeys.signin_username.tr,
                    ),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 8, 18, 0),
                      child: Text("Forgot Password?",
                          style: textStyleApp.copyWith(fontSize: 13)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: Obx(() {
                  return TextField(
                    onChanged: controller.onPasswordChanged,
                    style: textStyleApp.copyWith(
                        fontSize: 13,
                        color: const Color.fromARGB(255, 96, 96, 96)),
                    obscureText: true,
                    decoration: InputDecoration(
                      errorText: controller.passwordErrorText.value,
                      labelText: LocaleKeys.signin_password.tr,
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: ScratchElevatedButton(
                  width: double.infinity,
                  onPressed: () {
                    // _doSignIn();
                  },
                  borderRadius: BorderRadius.circular(4),
                  child: Text(LocaleKeys.signin_title.tr),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "New to Scratch?",
                        style: textStyleApp.copyWith(
                            fontSize: 13,
                            color: const Color.fromARGB(255, 168, 168, 168)),
                      ),
                    ),
                    Center(
                      child: Text("Create Account Here",
                          style: textStyleApp.copyWith(
                              fontSize: 14,
                              color: mainColor,
                              fontWeight: FontWeight.w300)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _welcomeView(double widthScreen, double heightScreen) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Image.asset(
          "assets/images/scratch_bg_1.png",
          fit: BoxFit.fill,
          width: widthScreen,
          height: heightScreen * 0.35,
        ),
        Positioned(
          top: widthScreen * 0.06,
          left: widthScreen * 0.06,
          child: Image.asset(
            "assets/images/scratch_logo.png",
            width: widthScreen * 0.27,
          ),
        ),
        Padding(
            padding: EdgeInsets.all(widthScreen * 0.06),
            child: Text(
              "Welcome Back!",
              style: textStyleApp.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 15),
            ))
      ],
    );
  }

  _uiSignIn() {
    return Stack(
      children: [
        Container(
          child: _inputLayout(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/images/sign_in_bg.png")),
              gradient: LinearGradient(
                colors: [topColor, bottomColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
        ),
      ],
    );
  }

  _inputLayout() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            width: constraints.maxWidth,
            height: constraints.maxWidth,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      LocaleKeys.signin_title.tr,
                      style: textStyleLarge,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextField(
                        onChanged: controller.onUsernameChanged,
                        decoration: InputDecoration(
                          errorText: controller.userErrorText.value,
                          labelText: LocaleKeys.signin_username.tr,
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextField(
                        onChanged: controller.onPasswordChanged,
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText: controller.passwordErrorText.value,
                          labelText: LocaleKeys.signin_password.tr,
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    HiElevatedButton(
                      width: double.infinity,
                      onPressed: () {
                        _doSignIn();
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Text(LocaleKeys.signin_title.tr),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _doSignIn() {
    controller.doSignIn();
  }

  void goToNextScreen() {
    Get.offAllNamed(Routes.HOME);
  }
}

import 'package:base_source/app/components/alert_dialog.dart';
import 'package:base_source/app/components/app_error.dart';
import 'package:base_source/app/components/user_list_row.dart';
import 'package:base_source/app/feature/user/viewmodels/user_view_model.dart';
import 'package:base_source/app/routes/app_routes.dart';
import 'package:base_source/data/user/model/users_list_model.dart';
import 'package:base_source/generated/locales.g.dart';
import 'package:base_source/translations/language_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<UserViewModel> {
  // const HomeScreen({Key? key}) : super(key: key);
  bool test = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(LocaleKeys.locale_title.tr),
        actions: [
          IconButton(
            onPressed: () async {
              showAlertDialog(
                  context: context,
                  message: LocaleKeys.locale_change_language.tr,
                  onConfirmed: () {
                    test = !test;
                    if (test) {
                      print("Tieng Viet");
                      LanguageService.to.changeLocale(Locale('vi', 'VN'));
                    } else {
                      print("Tieng Anh Quoc");
                      LanguageService.to.changeLocale(Locale('en', 'US'));
                    }
                  },
                  onCancel: () {
                    print("Cancel");
                  });
            },
            icon: const Icon(Icons.language),
          ),
          IconButton(
            onPressed: () async {
              controller.getUsers();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(),
          ],
        ),
      ),
    );
  }

  _ui() {
    return controller.obx(
      (state) => _uiUsersList(),
      onEmpty: const Text('No data found'),
      onError: (error) => AppError(
        errortxt: error ?? "",
      ),
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Expanded _uiUsersList() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            UserModel userModel = controller.userListModel[index];
            return UserListRow(
              userModel: userModel,
              onTap: () async {
                controller.setSelectedUser(userModel);
                gotoDetail(userModel);
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: controller.userListModel.length,
        ),
      ),
    );
  }

  void gotoDetail(UserModel userModel) {
    var arguments = {
      "username": "${userModel.username}",
      "name": "${userModel.name}",
      "id": "${userModel.id}",
      "city": "${userModel.address?.city}",
      "street": "${userModel.address?.street}",
      "company": "${userModel.company}",
      "email": "${userModel.email}",
      "phone": "${userModel.phone}",
      "website": "${userModel.website}",
    };
    Get.toNamed(Routes.DETAILS, arguments: arguments);

    // Get.toNamed(Routes.PHOTO_LIST);
  }

  Future<void> _onRefresh() async {
    controller.getUsers();
  }
}

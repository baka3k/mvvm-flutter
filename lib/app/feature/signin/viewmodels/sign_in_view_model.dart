import 'package:base_source/app/base/base_viewmodel.dart';
import 'package:base_source/app/base/view_state.dart';
import 'package:base_source/data/account/account_repository.dart';
import 'package:base_source/data/base/data_result.dart';
import 'package:base_source/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInViewModel extends BaseViewModel {
  final AccountRepository _accountRepository;
  final RxString _username = RxString('');
  final RxString _password = RxString('');
  final Rxn<ViewState> _signInViewState = Rxn<ViewState>();
  final RxnString _userErrorText = RxnString(null);
  final RxnString _passwordErrorText = RxnString(null);
  final RxBool _loading = RxBool(false);
  // get
  RxnString get passwordErrorText => _passwordErrorText;
  RxBool get loading => _loading;
  RxnString get userErrorText => _userErrorText;
  Rxn<ViewState> get signInViewState => _signInViewState;
  SignInViewModel(this._accountRepository);

  @override
  void onInit() {
    super.onInit();
    debounce<String>(_username, _validateUsername,
        time: const Duration(milliseconds: 1000));
    debounce<String>(_password, _validatePassword,
        time: const Duration(milliseconds: 1000));
  }

  void onUsernameChanged(String usn) {
    _username.value = usn;
    _validateUsername(usn);
  }

  void _validateUsername(String usn) {
    if (usn.length <= 5 || usn.length >= 50) {
      _userErrorText.value = LocaleKeys.signin_error_username_length.tr;
    } else if (!_isFormatUserNameCorrect(usn)) {
      _userErrorText.value = LocaleKeys.signin_error_username_format.tr;
    } else {
      _userErrorText.value = null;
    }
  }

  void onPasswordChanged(String pass) {
    _password.value = pass;
    _validatePassword(pass);
  }

  void _validatePassword(String pass) {
    if (pass.length <= 5 || pass.length >= 20) {
      _passwordErrorText.value = LocaleKeys.signin_error_password_length.tr;
    } else if (!_isFormatPasswordCorrect(pass)) {
      _passwordErrorText.value = LocaleKeys.signin_error_password_format.tr;
    } else {
      _passwordErrorText.value = null;
    }
  }

  void doSignIn() {
    // hide keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    _validateUsername(_username.value);
    _validatePassword(_password.value);

    if (_verifyInput()) {
      signIn();
    } else {
      print("#doSignIn(): input is invalid");
    }
  }

  Future<void> signIn() async {
    _loading.value = true;
    var response =
        await _accountRepository.signIn(_username.value, _password.value);
    _loading.value = false;
    if (response.isSuccess) {
      _signInSuccessed();
    } else if (response.isFailure) {
      var error = response.error;
      if (error is APIFailure) {
        _signInError(error.errorResponse);
      }
    } else {}

  }

  bool _verifyInput() {
    return _userErrorText.value == null && _passwordErrorText.value == null;
  }

  bool _isFormatUserNameCorrect(String usn) {
    // for test
    return true;
  }

  bool _isFormatPasswordCorrect(String pass) {
    // for test
    return true;
  }

  void _signInSuccessed() {
    _signInViewState.value = ViewState.success(true);
  }

  void _signInError(String errorResponse) {
    _signInViewState.value = ViewState.failure(ViewError(0, errorResponse));
  }
}

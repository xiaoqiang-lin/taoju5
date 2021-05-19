/*
 * @Description: 定义校验器
 * @Author: iamsmiling
 * @Date: 2021-05-13 10:51:59
 * @LastEditTime: 2021-05-14 11:18:14
 */
import 'package:taoju5_c/utils/toast.dart';

class VerifyCallback {
  Function()? onSuccess;

  Function()? onFailure;

  VerifyCallback({this.onSuccess, this.onFailure});
}

abstract class Validator {
  bool validate();

  void setNextValidator(Validator validator);

  bool warning(String message);
}

abstract class AbstractValidator implements Validator {
  String? field;
  String errorMessage;
  Validator? nextValidator;
  VerifyCallback? callback;

  AbstractValidator(
      {required this.field, required this.errorMessage, this.callback});

  @override
  setNextValidator(Validator validator) {
    nextValidator = validator;
  }

  @override
  bool warning(String message) {
    if (callback != null && callback!.onFailure != null) {
      callback!.onFailure!();
    }
    if (message.isNotEmpty) {
      ToastKit.warning(message);
    }
    throw ArgumentError(message);
  }

  bool next() {
    if (callback != null && callback!.onSuccess != null) {
      callback!.onSuccess!();
    }
    if (nextValidator == null) return true;
    return nextValidator!.validate();
  }
}

class EmptyValidator extends AbstractValidator {
  EmptyValidator(
      {required String? field,
      required String errorMessage,
      VerifyCallback? callback})
      : super(field: field, errorMessage: errorMessage, callback: callback);

  @override
  bool validate() {
    if (field == null || field!.isEmpty) {
      warning(errorMessage);
      throw ArgumentError.value(field, errorMessage);
    }
    return next();
  }
}

class ValidatorManager {
  List<Validator> _validators = [];

  ValidatorManager addValidator(Validator validator) {
    _validators.add(validator);
    return this;
  }

  ValidatorManager addValidators(List<Validator> validators) {
    _validators.addAll(validators);
    return this;
  }

  bool execute() {
    if (_validators.isEmpty) return true;
    for (int i = 0; i < _validators.length; i++) {
      Validator v = _validators[i];
      if (i < _validators.length - 1) {
        v.setNextValidator(_validators[i + 1]);
      }
    }
    return _validators.first.validate();
  }

  bool executeAll() {
    if (_validators.isEmpty) return true;
    List<bool> list = [];
    for (Validator v in _validators) {
      try {
        v.validate();
        list.add(true);
      } catch (err) {
        list.add(false);
      }
    }
    bool flag = list.every((e) => e);
    if (flag) return true;
    throw ArgumentError("参数错误");
  }
}

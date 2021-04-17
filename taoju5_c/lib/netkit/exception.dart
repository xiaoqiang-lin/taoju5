/// 接口的code没有返回为true的异常
class NetErrorException implements Exception {
  String message;

  NetErrorException.fromMessage(String val) {
    message = val;
  }

  @override
  String toString() {
    return 'NetErrorException{respData: $message}';
  }
}

/// 接口的code没有返回为true的异常
class ParseDataErrorException implements Exception {
  String message;

  ParseDataErrorException.fromMessage(String val) {
    message = val;
  }

  @override
  String toString() {
    return 'ParseDataErrorException{respData: $message}';
  }
}

/// 用于未登录等权限不够,需要跳转授权页面
class UnAuthorizedException implements Exception {
  const UnAuthorizedException();

  @override
  String toString() => 'UnAuthorizedException';
}

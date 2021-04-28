/*
 * @Description: 自定义的code
 * @Author: iamsmiling
 * @Date: 2021-04-26 18:04:07
 * @LastEditTime: 2021-04-27 16:01:53
 */

enum Taoju5HttpStatus { unLogin, inValidToken, invalidParams }

extension Taoju5HttpStatusKit on Taoju5HttpStatus {
  int? get code => {
        Taoju5HttpStatus.unLogin: -999,
        Taoju5HttpStatus.inValidToken: -9999,
        Taoju5HttpStatus.invalidParams: -100,
      }[this];
}

// part of R;

enum PrimaryButtonSize { defaultSize, medium, small, mini }

class CDimen {
  static CDimen _singleton = CDimen._();
  // ignore: unused_element
  CDimen._();
  factory CDimen() => _singleton;

  final double dp1 = 1;

  final double dp16 = 16;

  final double dp12 = 12;

  final double dp8 = 8;

  final double dp3 = 3;

  final double dp20 = 20;

  final double dp10 = 10;
  final double dp36 = 36;
  final double dp44 = 44;
  final double dp48 = 48;

  final double dp84 = 84;

  final double sp2 = 2;

  final double sp8 = 8;
  final double sp10 = 10;
  final double sp12 = 12;
  final double sp15 = 15;

  final double sp16 = 16;

  final double sp18 = 18;

  final double sp24 = 24;

  final double sp32 = 32;

  final double sp13 = 13;
}

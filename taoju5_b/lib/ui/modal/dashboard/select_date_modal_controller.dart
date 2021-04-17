import 'package:get/get.dart';

enum SelectDateMode { byMonth, byYear }

class SelectDateModalController extends GetxController {
  SelectDateMode selectMode = SelectDateMode.byMonth;

  int currentYear;
  int currentMonth;

  List<int> yearOptionList = [];

  List<int> monthOptionList = [];

  void switchMode(SelectDateMode mode) {
    selectMode = mode;
    update(["mode"]);
  }

  void selectYear(int index) {
    currentYear = yearOptionList[index];
  }

  void selectMonth(int index) {
    currentMonth = monthOptionList[index];
  }

  @override
  void onInit() {
    _initData();
    super.onInit();
  }

  _initData() {
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;
    currentYear = year;
    currentMonth = month;
    for (int i = 0; i < 10; i++) {
      yearOptionList.add(year - i);
    }
    monthOptionList = List.generate(12, (index) => index + 1);
  }
}

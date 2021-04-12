class PageKit {
  // List<String> _history;
  int count = 0;
  final int maxLength;
  PageKit({this.maxLength = 3}) {
    // _history = List.filled(maxLength, null);
  }

  bool get hasOverflow => count > maxLength;

  void add(String item) {
    count++;
    // if (count > maxLength) {
    //   String page = _history?.first;
    //   // Navigator.of(Get.context).removeRoute(
    //   //   MaterialPageRoute(fullscreenDialog: )
    //   // );
    //   // Get.offNamed(page, preventDuplicates: false);
    // }
    // _history[count % maxLength] = item;
  }
}

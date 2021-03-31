// part of R;
class CImage {
  static CImage _singleton = CImage();
  // ignore: unused_element
  CImage._();
  factory CImage() => _singleton;
}

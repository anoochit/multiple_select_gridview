import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool checkboxVisible = false.obs;

  final listData = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  RxList<bool> listCheckBox = <bool>[].obs;

  RxInt chckBoxItems = 0.obs;

  @override
  void onInit() {
    super.onInit();
    listCheckBox.clear();
    listData.forEach((v) => listCheckBox.add(false));
  }

  setCheckboxVisible(bool show) {
    checkboxVisible.value = show;
  }

  void selectAll() {
    listCheckBox.replaceRange(
        0, listCheckBox.length, List.filled(listCheckBox.length, true));
    calculateCheckBox();
  }

  calculateCheckBox() {
    chckBoxItems.value = listCheckBox.where((p) => (p == true)).length;
  }

  void setCheckboxValue(int index, bool value) {
    listCheckBox[index] = value;
    calculateCheckBox();
  }
}

import 'package:get/get.dart';

class HomeController extends GetxController {
  // Use private properties with descriptive names
  final RxBool _isCheckboxVisible = false.obs;
  final List<String> _listData = [
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

  // Use more descriptive variable names
  final RxList<bool> _itemCheckStates = <bool>[].obs;
  final RxInt _selectedItemCount = 0.obs;

  // Getters for reactive properties
  bool get isCheckboxVisible => _isCheckboxVisible.value;
  List<String> get listData => _listData;
  List<bool> get itemCheckStates => _itemCheckStates;
  int get selectedItemCount => _selectedItemCount.value;

  @override
  void onInit() {
    super.onInit();
    // Use more concise initialization
    _itemCheckStates.value = List.generate(_listData.length, (_) => false);
  }

  // Renamed for clarity and added type annotation
  void toggleCheckboxVisibility(bool isVisible) {
    _isCheckboxVisible.value = isVisible;
  }

  // Simplified select all method
  void selectAllItems() {
    _itemCheckStates.value = List.generate(_listData.length, (_) => true);
    _updateSelectedItemCount();
  }

  // Renamed for clarity
  void _updateSelectedItemCount() {
    _selectedItemCount.value =
        _itemCheckStates.where((isChecked) => isChecked).length;
  }

  // Improved method for updating individual item check state
  void updateItemCheckState(int index, bool isChecked) {
    if (index >= 0 && index < _itemCheckStates.length) {
      _itemCheckStates[index] = isChecked;
      _updateSelectedItemCount();
    }
  }

  // Optional: Method to clear all selections
  void clearAllSelections() {
    _itemCheckStates.value = List.generate(_listData.length, (_) => false);
    _updateSelectedItemCount();
  }
}

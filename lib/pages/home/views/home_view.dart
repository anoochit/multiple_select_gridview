import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // toolbar
          Obx(
            () => Visibility(
              visible: controller.checkboxVisible.value,
              child: Container(
                height: kToolbarHeight,
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.selectAll();
                        },
                        child: const Text('Select All')),
                    TextButton(
                      onPressed: () {
                        controller.setCheckboxVisible(false);
                      },
                      child: const Text('Cancel'),
                    )
                  ],
                ),
              ),
            ),
          ),
          // grid
          Expanded(
            child: GridView.builder(
              itemCount: controller.listData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                final item = controller.listData[index];

                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onLongPress: () {
                      controller.setCheckboxVisible(true);
                    },
                    child: Stack(
                      children: [
                        // content
                        Center(child: Text(item)),

                        // checkbox
                        Positioned(
                            right: 0,
                            child: Obx(
                              () => Visibility(
                                visible: controller.checkboxVisible.value,
                                child: Checkbox(
                                  value: controller.listCheckBox[index],
                                  onChanged: (value) {
                                    controller.listCheckBox[index] = value!;
                                  },
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

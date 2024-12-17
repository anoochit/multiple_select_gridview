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
              visible: controller.isCheckboxVisible,
              child: Container(
                height: kToolbarHeight,
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        //
                      },
                      child:
                          Text('Select ${controller.selectedItemCount} items'),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          controller.selectAllItems();
                        },
                        child: const Text('Select All')),
                    TextButton(
                      onPressed: () {
                        controller.toggleCheckboxVisibility(false);
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
              padding: const EdgeInsets.all(4.0),
              itemCount: controller.listData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final item = controller.listData[index];

                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onLongPress: () {
                      controller.toggleCheckboxVisibility(true);
                    },
                    child: Stack(
                      children: [
                        // content
                        Center(child: Text(item)),

                        // checkbox
                        Positioned(
                            top: 4,
                            right: 4,
                            child: Obx(
                              () => Visibility(
                                visible: controller.isCheckboxVisible,
                                child: Checkbox(
                                  value: controller.itemCheckStates[index],
                                  onChanged: (value) {
                                    controller.updateItemCheckState(
                                        index, value!);
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

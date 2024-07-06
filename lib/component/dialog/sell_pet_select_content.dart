import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/component/pet-list-item/sell_pet_list_item.dart';
import 'package:vetner360/controller/sell_my_pet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellPetSelectContent extends StatelessWidget {
  const SellPetSelectContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellMyPetController>(
      init: SellMyPetController(context),
      builder: (_) => RefreshIndicator(
        onRefresh: () => Future.sync(() => _.pagingController.value.refresh()),
        child: PagedListView<int, dynamic>(
          pagingController: _.pagingController.value,
          builderDelegate: PagedChildBuilderDelegate<dynamic>(
            animateTransitions: true,
            transitionDuration: const Duration(milliseconds: 500),
            itemBuilder: (context, item, index) => Padding(
              key: ValueKey(item['id']),
              padding: const EdgeInsets.only(
                  left: 0.0, right: 0.0, top: 9.0, bottom: 9.0),
              child: SellPetListItem(
                petItem: item,
                isSellActive: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

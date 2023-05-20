import 'package:last_done/home/entity/last_done_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'last_done_item_list_model.g.dart';

@riverpod
class LastDoneItemList extends _$LastDoneItemList {
  @override
  List<LastDoneItem> build() {
    return [
      LastDoneItem(id: '001', title: "Wash Clothes"),
      LastDoneItem(id: '001', title: "Find Man Yi for lunch"),
      LastDoneItem(id: '001', title: "Play games"),
      LastDoneItem(id: '001', title: "Sleep"),
      LastDoneItem(id: '001', title: "Dream"),
      LastDoneItem(id: '001', title: "Consider the existence of cheese"),
      LastDoneItem(id: '001', title: "Debug Code"),
      LastDoneItem(id: '001', title: "Debug More Code"),
      LastDoneItem(id: '001', title: "Debug More Code I guess"),
      LastDoneItem(id: '001', title: "Sleep"),
      LastDoneItem(id: '001', title: "Dream"),
      LastDoneItem(id: '001', title: "Consider the existence of cheese"),
      LastDoneItem(id: '001', title: "Debug Code"),
      LastDoneItem(id: '001', title: "Debug More Code"),
      LastDoneItem(id: '001', title: "Debug More Code I guess"),
      LastDoneItem(id: '001', title: "Debug More Code"),
      LastDoneItem(id: '001', title: "Debug More Code I guess"),
      LastDoneItem(id: '001', title: "Sleep"),
      LastDoneItem(id: '001', title: "Dream"),
      LastDoneItem(id: '001', title: "Consider the existence of cheese"),
      LastDoneItem(id: '001', title: "Debug Code"),
      LastDoneItem(id: '001', title: "Debug More Code"),
      LastDoneItem(id: '001', title: "Debug More Code I guess"),
    ];
  }

  void onReorder(int oldIndex, int newIndex) {
    final itemInQuestion = state.removeAt(oldIndex);
    state.insert(newIndex, itemInQuestion);
  }
}

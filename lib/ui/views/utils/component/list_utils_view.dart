import 'package:flutter/material.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/data/models/global/picker_data.dart';
import 'package:skybase/ui/widgets/base/sky_list_view.dart';
import 'package:skybase/ui/widgets/common_widget.dart';
import 'package:skybase/ui/widgets/ordered_list.dart';
import 'package:skybase/ui/widgets/picker/picker_listview.dart';
import 'package:skybase/ui/widgets/sky_grouped_listview.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';
import 'package:skybase/ui/widgets/unordered_list.dart';

class ListUtilsView extends StatelessWidget {
  const ListUtilsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'List Utility'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._buildSection(
              page: 1,
              title: 'Sample Grouped ListView',
              content: SkyListView(
                loadingEnabled: false,
                errorEnabled: false,
                onRetry: () {},
                onRefresh: () {},
                emptyEnabled: dummyData.isEmpty,
                child: SkyGroupedListView<dynamic, String>(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  sortBy: SortBy.ASC,
                  data: dummyData,
                  separator: const Divider(thickness: 1, height: 12),
                  separatorGroup: const Divider(
                    thickness: 1,
                    height: 12,
                    color: Colors.red,
                  ),
                  groupHeaderBuilder: (group) {
                    return Text(
                      group.toString(),
                      textAlign: TextAlign.center,
                      style: AppStyle.headline4.copyWith(
                        fontWeight: AppStyle.semiBold,
                      ),
                    );
                  },
                  itemBuilder: (context, index, item) {
                    return Text(
                      item['name'],
                      textAlign: TextAlign.start,
                      style: AppStyle.body1,
                    );
                  },
                  groupBy: (element) => element['group'],
                ),
              ),
            ),
            const SizedBox(height: 36),
            ..._buildSection(
              page: 2,
              title: 'Sample Picker ListView',
              content: SkyListView(
                loadingEnabled: false,
                errorEnabled: false,
                onRetry: () {},
                onRefresh: () {},
                emptyEnabled: dummyData.isEmpty,
                child: PickerListView(
                  type: ListPickerType.single,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separator: const Divider(thickness: 1, height: 16),
                  data: dummyData.map((e) => PickerData(data: e)).toList(),
                  itemBuilder: (PickerData<dynamic> item) {
                    return SizedBox(
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.data['name']),
                          (item.isSelected)
                              ? const Icon(Icons.check)
                              : const SizedBox.shrink()
                        ],
                      ),
                    );
                  },
                  onChanged: (context, index, firstItem, listItem) {
                    debugPrint('First item = $firstItem');
                    debugPrint('All item = $listItem');
                  },
                ),
              ),
            ),
            ..._buildSection(
              page: 3,
              title: 'Unordered List',
              content: const UnorderedList(
                data: {
                  'Name': 'Product A',
                  'Weight': '300 gram',
                  'Spec': 'Lorem ipsum sit dorom amet..'
                },
                captionData: {
                  'Name': 'Some for name',
                  'Spec': 'Some for Spec',
                },
              ),
            ),
            const SizedBox(height: 36),
            ..._buildSection(
              page: 4,
              title: 'Ordered List',
              content: OrderedList(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Text('Data $index');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSection({
    required int page,
    required String title,
    required Widget content,
  }) {
    return [
      Text('Page $page', style: AppStyle.subtitle2),
      const SizedBox(height: 12),
      Center(child: Text(title)),
      SizedBox(
        child: ContentWrapper(
          top: true,
          child: content,
        ),
      ),
    ];
  }
}

final dummyData = [
  {
    'group': 'Jakarta',
    'name': 'Gambir',
    'date': DateTime.now(),
  },
  {
    'group': 'Lampung',
    'name': 'Pringsewu',
    'date': DateTime.now().add(const Duration(days: 12)),
  },
  {
    'group': 'Jakarta',
    'name': 'Tebet',
    'date': DateTime.now().add(const Duration(days: 1)),
  },
  {
    'group': 'Bandung',
    'name': 'Setrasari',
    'date': DateTime.now().add(const Duration(days: 2)),
  },
  {
    'group': 'Lampung',
    'name': 'Pesawaran',
    'date': DateTime.now().add(const Duration(days: 2)),
  },
  {
    'group': 'Yogyakarta',
    'name': 'Yogyakarta',
    'date': DateTime.now().add(const Duration(days: 12)),
  },
  {
    'group': 'Yogyakarta',
    'name': 'Yogyakarta2',
    'date': DateTime.now().add(const Duration(days: 12)),
  },
  {
    'group': 'Lampung',
    'name': 'Metro',
    'date': DateTime.now().add(const Duration(days: 1)),
  },
  {
    'group': 'Bandung',
    'name': 'Gedebage',
    'date': DateTime.now().add(const Duration(days: 1)),
  },
  {
    'group': 'Bandung',
    'name': 'Cihanjuang',
    'date': DateTime.now(),
  },
  {
    'group': 'Jakarta',
    'name': 'Sudirman',
    'date': DateTime.now().subtract(const Duration(days: 4)),
  },
];

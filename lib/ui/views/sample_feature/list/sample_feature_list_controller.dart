import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:skybase/config/base/pagination_controller.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository.dart';
import 'package:skybase/data/sources/local/cached_key.dart';
import 'package:skybase/ui/views/sample_feature/detail/sample_feature_detail_view.dart';

class SampleFeatureListController extends PaginationController<SampleFeature> {
  final SampleFeatureRepository repository;

  SampleFeatureListController({required this.repository});

  @override
  void onInit() {
    loadData(() => getUsers());
    super.onInit();
  }

  @override
  void onRefresh() async {
    await deleteCached(CachedKey.SAMPLE_FEATURE_LIST);
    super.onRefresh();
  }

  void getUsers() async {
    try {
      final response = await repository.getUsers(
        cancelToken: cancelToken,
        page: page,
        perPage: perPage,
      );
      loadNextData(data: response);
    } catch (e) {
      debugPrint('Error : $e');
      loadError(e.toString());
    }
  }

  void onChooseUser({required int id, required String username}) {
    Get.toNamed(
      SampleFeatureDetailView.route,
      arguments: {
        'id': id,
        'username': username,
      },
    );
  }
}

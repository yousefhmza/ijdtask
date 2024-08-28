import 'package:dartz/dartz.dart';
import 'package:ijdtask/modules/home/models/category_model.dart';
import 'package:ijdtask/modules/home/models/suggestion_model.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/endpoints.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';

class HomeRepository extends BaseRepository {
  final ApiClient _apiClient;

  HomeRepository(this._apiClient, super.networkInfo);

  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    return super.call<List<CategoryModel>>(
      httpRequest: () async => await _apiClient.get(url: EndPoints.getCategories),
      successReturn: (data) => List<CategoryModel>.from(data.map((category) => CategoryModel.fromJson(category))),
    );
  }

  Future<Either<Failure, List<Suggestion>>> getSuggestions() async {
    return super.call<List<Suggestion>>(
      httpRequest: () async => await _apiClient.get(url: EndPoints.getSuggestions),
      successReturn: (data) => List<Suggestion>.from(data.map((suggestion) => Suggestion.fromJson(suggestion))),
    );
  }
}

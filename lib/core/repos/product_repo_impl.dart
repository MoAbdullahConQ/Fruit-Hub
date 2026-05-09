import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/entities/product_entity.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/repos/product_repo.dart';
import 'package:ecommerce_app/core/services/database_service.dart';
import 'package:ecommerce_app/core/utils/backend_endpoints.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpoints.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((doc) => ProductModel.fromJson(doc).toEntity()).toList();
      return right(products );
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }
}

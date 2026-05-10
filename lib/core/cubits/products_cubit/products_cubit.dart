import 'package:ecommerce_app/core/entities/product_entity.dart';
import 'package:ecommerce_app/core/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());

  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getProduct();

    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) => emit(ProductsSuccess(products)),
    );
  }
  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellingProducts();

    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) => emit(ProductsSuccess(products)),
    );
  }


}

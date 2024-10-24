import 'package:craftybay/data/models/product_model.dart';
import 'package:craftybay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HorizontalProductListView extends StatelessWidget {
  const HorizontalProductListView({
    super.key,
    required this.productList,
  });

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return  ProductCard(
          product: productList[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 8,
      ),
    );
  }
}
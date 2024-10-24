import 'package:craftybay/data/models/product_model.dart';
import 'package:craftybay/presentation/ui/screens/product_details_screen.dart';
import 'package:craftybay/presentation/ui/utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> ProductDetailsScreen(productId: product.id!,));
      },
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Container(
          width: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 90,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                  color: AppColors.themeColor.withOpacity(0.2),
                  image: DecorationImage(
                    image: NetworkImage(product.image ?? ' '),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      product.title ?? ' ',
                      maxLines: 1,
                      style:const TextStyle(
                        color: Colors.lightBlue,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price}',
                          style:const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.themeColor,
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                           const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              '${product.star}',
                              style:const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            color: AppColors.themeColor,
                            child: const Icon(
                              Icons.favorite_border_outlined,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

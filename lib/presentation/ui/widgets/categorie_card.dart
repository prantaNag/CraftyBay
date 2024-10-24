
import 'package:craftybay/data/models/category_model.dart';
import 'package:craftybay/presentation/ui/screens/product_list_screen.dart';
import 'package:craftybay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorieCard extends StatelessWidget {
  const CategorieCard({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () =>  ProductListScreen(category: categoryModel),
        );
      },
      child: Column(
        children: [
          Container(
            padding:const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.themeColor.withOpacity(0.2),
            ),
            child: Image.network(categoryModel.categoryImg ?? '', width: 45, height: 40,),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            categoryModel.categoryName ?? '',
            style:const TextStyle(
              color: AppColors.themeColor,
            ),
          ),
        ],
      ),
    );
  }
}

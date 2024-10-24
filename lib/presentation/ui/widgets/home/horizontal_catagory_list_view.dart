
import 'package:craftybay/data/models/category_model.dart';

import 'package:craftybay/presentation/ui/widgets/categorie_card.dart';
import 'package:flutter/material.dart';

class HorizontalCatagoryListView extends StatelessWidget {
  const HorizontalCatagoryListView({
    super.key, required this.categoryList,
  });


final List<CategoryModel> categoryList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return CategorieCard(
          categoryModel: categoryList[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 8,
      ),
    );
  }
}


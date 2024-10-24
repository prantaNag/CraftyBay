import 'package:craftybay/presentation/ui/utils/app_colors.dart';
import 'package:craftybay/presentation/ui/utils/assets_part.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
      child: Row(
        children: [
          _buildProductImage(),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title of Product",
                            style: textTheme.bodyLarge,
                          ),
                          _buildColorAndSize()
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                _buildPriceAndCounter(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildColorAndSize() {
    return Wrap(
      spacing: 6,
      children: [
        Text(
          'Color: Green',
          style: textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        Text(
          'Size: XL',
          style: textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPriceAndCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("\$100",
            style: textTheme.bodyMedium?.copyWith(color: AppColors.themeColor)),
        ItemCount(
          initialValue: 1,
          minValue: 1,
          maxValue: 20,
          decimalPlaces: 0,
          color: AppColors.themeColor,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image.asset(
        AssetsPath.dummyProdectImage,
        height: 80,
        width: 80,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

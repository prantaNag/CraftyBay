import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/presentation/ui/utils/app_colors.dart';
import 'package:craftybay/presentation/ui/utils/assets_part.dart';
import 'package:flutter/material.dart';

class ProductDetailsSlider extends StatelessWidget {
  const ProductDetailsSlider({
    super.key, required List sliderListUrl,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220.0,
            onPageChanged: (index, reason) => {
              _selectedIndex.value = index,
            },
            viewportFraction: 1,
            
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration:const BoxDecoration(
                    color: Colors.blueGrey,
                    image: DecorationImage(image: AssetImage(AssetsPath.dummyProdectImage),),
                  ),
                );
              },
            );
          }).toList(),
        ),
     
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (context, currentIndex, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: currentIndex == i ? AppColors.themeColor : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.blueGrey),
                      ),
                    ),
                ],
              );
              
            },
          ),
        ),
      ],
    );
  }
}

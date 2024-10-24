import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/presentation/state_holders/slider_list_controller.dart';
import 'package:craftybay/presentation/ui/utils/app_colors.dart';
import 'package:craftybay/presentation/ui/widgets/centered_circular_prograss_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBannerSlider extends StatelessWidget {
  const HomeBannerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

    return GetBuilder<SliderListController>(builder: (sliderListController) {
      return Visibility(
        visible: !sliderListController.inProgress,
        replacement: const SizedBox(
          height: 190,
          child: CenteredCircularPrograssIndicator(),
        ),
        child: Column(
          children: [
            _buildCarouselSlider(_selectedIndex, sliderListController),
            const SizedBox(
              height: 10,
            ),
            _buildCarouselList(_selectedIndex, sliderListController),
          ],
        ),
      );
    });
  }

  Widget _buildCarouselSlider(ValueNotifier<int> _selectedIndex,
      SliderListController sliderListController) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 170.0,
        viewportFraction: 1,
        onPageChanged: (index, reason) => {
          _selectedIndex.value = index,
        },
      ),
      items: sliderListController.sliders.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(slider.image ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      slider.price!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.themeColor,
                        ),
                        onPressed: () {},
                        child: Text("Buy Now"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildCarouselList(ValueNotifier<int> _selectedIndex,
      SliderListController sliderListController) {
    return ValueListenableBuilder(
      valueListenable: _selectedIndex,
      builder: (context, currentIndex, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < sliderListController.sliders.length; i++)
              Container(
                height: 12,
                width: 12,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: currentIndex == i ? AppColors.themeColor : null,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blueGrey),
                ),
              ),
          ],
        );
      },
    );
  }
}

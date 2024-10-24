import 'package:craftybay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:craftybay/presentation/state_holders/category_list_controller.dart';
import 'package:craftybay/presentation/state_holders/new_product_list_controller.dart';
import 'package:craftybay/presentation/state_holders/popular_product_list_controller.dart';
import 'package:craftybay/presentation/state_holders/special_product_list_controller.dart';

import 'package:craftybay/presentation/ui/utils/assets_part.dart';
import 'package:craftybay/presentation/ui/widgets/home/app_bar_icons_button.dart';
import 'package:craftybay/presentation/ui/widgets/home/home_banner_slider.dart';
import 'package:craftybay/presentation/ui/widgets/home/horizontal_catagory_list_view.dart';
import 'package:craftybay/presentation/ui/widgets/home/horizontal_product_list_view.dart';
import 'package:craftybay/presentation/ui/widgets/search_text_field.dart';
import 'package:craftybay/presentation/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: SearchTextField(
                    textEditingController: TextEditingController(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const HomeBannerSlider(),
                const SizedBox(
                  height: 8,
                ),
                _buildCatagoriesSection(),
                const SizedBox(
                  height: 8,
                ),
                _buildPopularProductsSection(),
                const SizedBox(
                  height: 8,
                ),
                _buildSpecialProductsSection(),
                const SizedBox(
                  height: 8,
                ),
                _buildNewProductsSection(),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildPopularProductsSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Populer',
          onTap: () {},
        ),
         SizedBox(
          height: 160,
          child: GetBuilder<PopularProductListController>(
              builder: (popularProductListController) {
            return Visibility(
              visible: !popularProductListController.inProgress,
              replacement: const CircularProgressIndicator(),
              child: HorizontalProductListView(
                productList: popularProductListController.productList,
              ),
            );
          }),
        ),
        /* const SizedBox(
          height: 160,
          child: HorizontalProductListView(),
        ), */
      ],
    );
  }

  Widget _buildNewProductsSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'New',
          onTap: () {},
        ),
        SizedBox(
          height: 160,
          child: GetBuilder<NewProductListController>(
              builder: (newProductListController) {
            return Visibility(
              visible: !newProductListController.inProgress,
              replacement: const CircularProgressIndicator(),
              child: HorizontalProductListView(
                productList: newProductListController.productList,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSpecialProductsSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Special',
          onTap: () {},
        ),
         SizedBox(
          height: 160,
          child: GetBuilder<SpecialProductListController>(
              builder: (specilaProductListController) {
            return Visibility(
              visible: !specilaProductListController.inProgress,
              replacement: const CircularProgressIndicator(),
              child: HorizontalProductListView(
                productList: specilaProductListController.productList,
              ),
            );
          }),
        ),
        /* const SizedBox(
          height: 160,
          child: HorizontalProductListView(),
        ), */
      ],
    );
  }

  Widget _buildCatagoriesSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Categories',
          onTap: () {
            Get.find<BottomNavBarController>().selectCategory();
          },
        ),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          height: 100,
          child: GetBuilder<CategoryListController>(
              builder: (categoryListController) {
            return Visibility(
              visible: !categoryListController.inProgress,
              replacement: const SingleChildScrollView(),
              child: HorizontalCatagoryListView(
                categoryList: categoryListController.categoryList,
              ),
            );
          }),
        ),
      ],
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
        AppbarIcons(
          iconData: Icons.person_2,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppbarIcons(
          iconData: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppbarIcons(
          iconData: Icons.notifications_on,
          onTap: () {},
        ),
      ],
    );
  }
}

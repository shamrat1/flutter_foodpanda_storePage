import 'package:flutter/material.dart';
import 'package:store_with_items/MenuItem.dart';

class CategorySection extends StatelessWidget {
  CategorySection({
    Key? key,
    // required this.category,
  }) : super(key: key);

  // final Category category;
  final List<MenuItem> foods = [
    MenuItem(id: 1,title: "Chees Burger",price: 200,detail: "Some Details",offerPrice: 250),
    MenuItem(id: 2,title: "Chees Burger",price: 200,detail: "Some Details",offerPrice: 250),
    MenuItem(id: 3,title: "Chees Burger",price: 200,detail: "Some Details",offerPrice: 250),
    MenuItem(id: 4,title: "Chees Burger",price: 200,detail: "Some Details",offerPrice: 250),
    MenuItem(id: 5,title: "Chees Burger",price: 200,detail: "Some Details",offerPrice: 250),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTileHeader(context),
          _buildFoodTileList(context),
        ],
      ),
    );
  }

  Widget _buildFoodTileList(BuildContext context) {
    return Column(
      children: List.generate(
        foods.length,
        (index) {
          final food = foods[index];
          bool isLastIndex = index == foods.length - 1;
          return _buildFoodTile(
            food: food,
            context: context,
            isLastIndex: isLastIndex,
          );
        },
      ),
    );
  }

  Widget _buildSectionTileHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _sectionTitle(context),
        const SizedBox(height: 8.0),
        _sectionSubtitle(context),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _sectionTitle(BuildContext context) {
    return Row(
      children: [
         _buildSectionHoteSaleIcon(),
        Text(
          "Something",
          style: _textTheme(context).headline6,
          // strutStyle: Helper.buildStrutStyle(_textTheme(context).headline6),
        )
      ],
    );
  }

  Widget _sectionSubtitle(BuildContext context) {
    return Text(
      "Something little details",
      style: _textTheme(context).subtitle2,
      // strutStyle: Helper.buildStrutStyle(_textTheme(context).subtitle2),
    );
  }

  Widget _buildFoodTile({
    required BuildContext context,
    required bool isLastIndex,
    required MenuItem food,
  }) {
    return Column(
      children: [
        Container(
          // color: Colors.blueAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildFoodDetail(food: food, context: context),
              _buildFoodImage('https://via.placeholder.com/100x100'),
            ],
          ),
        ),
        !isLastIndex ? const Divider(height: 16.0) : const SizedBox(height: 8.0)
      ],
    );
  }

  Widget _buildFoodImage(String url) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/transparent.png',
      image: url,
      width: 64,
    );
  }

  Widget _buildFoodDetail({
    required BuildContext context,
    required MenuItem food,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(food.title!, style: _textTheme(context).subtitle1),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              food.price!.toString(),
              style: _textTheme(context).caption,
              // strutStyle: Helper.buildStrutStyle(_textTheme(context).caption),
            ),
            Text(
              food.offerPrice.toString(),
              // strutStyle: Helper.buildStrutStyle(_textTheme(context).caption),
              style: _textTheme(context).caption?.copyWith(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: 8.0),
            _buildFoodHotSaleIcon(),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionHoteSaleIcon() {
    return Container(
      margin: const EdgeInsets.only(right: 4.0),
      child: Icon(
        Icons.whatshot,
        color: Colors.red,
        size: 20.0,
      ),
    );
  }

  Widget _buildFoodHotSaleIcon() {
    return Container(
      child: Icon(Icons.whatshot, color: Colors.red, size: 16.0),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  TextTheme _textTheme(context) => Theme.of(context).textTheme;
}

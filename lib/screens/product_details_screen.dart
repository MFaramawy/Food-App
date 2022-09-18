import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/screens/cart_screen.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/core/utils/app_colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/core/utils/assets_manager.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.model}) : super(key: key);

  final ProductModel model;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int counter = 1;
  bool isFavorite = false;
  int price = 0;

  @override
  void initState() {
    super.initState();
    price = widget.model.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              color: isFavorite ? Colors.red : Colors.black,
              padding: EdgeInsets.zero,
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () => setState(() => isFavorite = !isFavorite),
            ),
          ),
          const SizedBox(width: 16),
        ],
        leadingWidth: 60,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            color: Colors.black,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsManager.bk),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white.withOpacity(.6),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(widget.model.image),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  children: [
                    Text(
                      widget.model.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Spacer(),
                    Text(
                      '\$$price',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  itemBuilder: (context, _) => const Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.primary),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.fastfood),
                        SizedBox(width: 8),
                        Text('Spicy')
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: const [
                        Icon(Icons.delivery_dining_outlined),
                        SizedBox(width: 8),
                        Text('36.minute')
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 90,
                      height: 40,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (counter > 1) {
                                    int m = widget.model.price;
                                    price = counter * m - m;
                                    counter--;
                                  } else {
                                    return;
                                  }
                                });
                              },
                              child: const Icon(Icons.remove)),
                          Text(
                            '$counter',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  int m = widget.model.price;
                                  price = m + counter * m;
                                  counter++;
                                });
                              },
                              child: const Icon(Icons.add)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Details', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                Text(
                  'chicken curry stewed in on onion and tomato-based sauce, flavoured with ginger garlic tomato puree, chilli peppers and a variety of spices, often including turmeric, cumin',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 30),
                Text('ingredients',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AssetsManager.ingredient, width: 40, height: 40),
            Image.asset(AssetsManager.ingredient1, width: 40, height: 40),
            FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () {
                setState(() => cartList.add(widget.model));
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (_) => CartScreen(price: price)),
                );
              },
              child: Image.asset(
                AssetsManager.bag1,
                width: 30,
                height: 30,
                color: Colors.black54,
              ),
            ),
            Image.asset(AssetsManager.ingredient2, width: 40, height: 40),
            Image.asset(AssetsManager.ingredient4, width: 40, height: 40),
          ],
        ),
      ),
    );
  }
}

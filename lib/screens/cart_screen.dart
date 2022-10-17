import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/cart_item.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/core/utils/app_colors.dart';
import 'package:food_delivery/core/utils/assets_manager.dart';

List<ProductModel> cartList = [];

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, required this.price}) : super(key: key);
  final int price;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int counters = 1;
  int tPrice = 0;
  @override
  void initState() {
    super.initState();
    tPrice = widget.price * counters;
    tPrice = tPrice;
  }

  void changePriceAdd(int index) {
    final int re = cartList[index].price;
    setState(() {
      tPrice += re;
      counters++;
    });
  }

  void changePriceRemove(int index) {
    final int re = cartList[index].price;
    setState(() {
      if (counters <= 1) return;
      tPrice -= re;
      counters--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 60,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text('Cart', style: TextStyle(color: Colors.black)),
        actions: const [
          CircleAvatar(
              radius: 25, backgroundImage: AssetImage(AssetsManager.bk)),
          SizedBox(width: 16),
        ],
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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
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
          color: Colors.white.withOpacity(.6),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Column(
              children: [
                Expanded(
                  child: cartList.isNotEmpty
                      ? ListView.separated(
                          itemCount: cartList.length,
                          padding: const EdgeInsets.fromLTRB(16, 140, 16, 16),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            return CartItem(
                              data: cartList,
                              index: index,
                              counter: counters,
                              onTapAdd: () => changePriceAdd(index),
                              onTapRemove: () => changePriceRemove(index),
                              confirmDismiss: (direction) async {
                                setState(() {
                                  if (direction !=
                                      DismissDirection.endToStart) {
                                    return;
                                  }
                                  cartList.remove(cartList[index]);
                                });
                                return null;
                              },
                            );
                          },
                        )
                      : emptyCartWidget(),
                ),
                Container(
                  height: 200,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 16),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sub Total',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Delivery',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Total',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '\$$tPrice',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '\$00',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '\$$tPrice',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                          ),
                          backgroundColor: AppColors.primary,
                          fixedSize: const Size(200, 60),
                        ),
                        child: Text(
                          'Check Out',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emptyCartWidget() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 150),
          const Image(
            width: 100,
            height: 100,
            image: AssetImage(AssetsManager.emptyCart),
          ),
          const SizedBox(height: 10),
          Opacity(
            opacity: 0.5,
            child: Text(
              'Cart is empty',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      );
}

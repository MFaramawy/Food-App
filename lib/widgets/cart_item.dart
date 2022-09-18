import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/core/utils/app_colors.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.data,
    required this.index,
    required this.counter,
    required this.onTapAdd,
    required this.onTapRemove,
    required this.confirmDismiss,
  }) : super(key: key);

  final int index;
  final int counter;
  final List<ProductModel> data;
  final void Function()? onTapAdd;
  final void Function()? onTapRemove;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('value'),
      background: Container(
        height: 180,
        width: double.infinity,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete_rounded),
      ),
      behavior: HitTestBehavior.deferToChild,
      dragStartBehavior: DragStartBehavior.down,
      direction: DismissDirection.horizontal,
      resizeDuration: const Duration(milliseconds: 200),
      // onDismissed: confirmDismiss,
      confirmDismiss: confirmDismiss,
      child: Container(
        height: 180,
        width: double.infinity,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image(
              width: 130,
              height: 130,
              fit: BoxFit.cover,
              image: AssetImage(data[index].image),
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data[index].title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  data[index].subTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                              onTap: onTapRemove,
                              child: const Icon(Icons.remove)),
                          Text(
                            '$counter',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          GestureDetector(
                              onTap: onTapAdd, child: const Icon(Icons.add)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 50),
                    Text(
                      '\$${data[index].price}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

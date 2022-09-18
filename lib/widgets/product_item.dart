import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.price,
    required this.image,
    required this.title,
    required this.subTitle,
    this.onPressedFavorite,
  }) : super(key: key);

  final String price;
  final String image;
  final String title;
  final String subTitle;
  final void Function()? onPressedFavorite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 200,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: onPressedFavorite,
                    icon: const Icon(Icons.favorite_border, size: 28),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image)),
          ),
        ),
      ],
    );
  }
}

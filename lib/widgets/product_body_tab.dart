import 'package:flutter/cupertino.dart';
import 'package:food_delivery/widgets/product_item.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/screens/product_details_screen.dart';

class ProductBodyTab extends StatelessWidget {
  const ProductBodyTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ProductModel.data;
    return GridView.builder(
      itemCount: data.length,
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: .740,
        crossAxisSpacing: 30,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => ProductDetailsScreen(model: data[index]),
          ),
        ),
        child: ProductItem(
          price: data[index].price.toString(),
          image: data[index].image,
          title: data[index].title,
          subTitle: data[index].subTitle,
        ),
      ),
    );
  }
}

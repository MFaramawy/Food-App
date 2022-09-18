import 'package:food_delivery/core/utils/assets_manager.dart';

class ProductModel {
  final int id;
  final int price;
  final String title;
  final String image;
  final String subTitle;
  final bool isFavorite;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.image,
    required this.subTitle,
    required this.isFavorite,
  });

  static final List<ProductModel> data = [
    ProductModel(
      id: 1,
      price: 30,
      title: 'Korean Bibimbap',
      image: AssetsManager.img,
      subTitle: 'Korean Bibimbap',
      isFavorite: false,
    ),
    ProductModel(
      id: 2,
      price: 30,
      title: 'Korean Bibimbap',
      image: AssetsManager.img1,
      subTitle: 'Korean Bibimbap',
      isFavorite: false,
    ),
    ProductModel(
      id: 3,
      price: 30,
      title: 'Korean Bibimbap',
      image: AssetsManager.img2,
      subTitle: 'Korean Bibimbap',
      isFavorite: false,
    ),
    ProductModel(
      id: 4,
      price: 30,
      title: 'Korean Bibimbap',
      image: AssetsManager.img3,
      subTitle: 'Korean Bibimbap',
      isFavorite: false,
    ),
    ProductModel(
      id: 5,
      price: 30,
      title: 'Korean Bibimbap',
      image: AssetsManager.img4,
      subTitle: 'Korean Bibimbap',
      isFavorite: false,
    ),
    ProductModel(
      id: 6,
      price: 30,
      title: 'Korean Bibimbap',
      image: AssetsManager.img5,
      subTitle: 'Korean Bibimbap',
      isFavorite: false,
    ),
    ProductModel(
      id: 7,
      price: 30,
      title: 'Korean Bibimbap',
      image: AssetsManager.img6,
      subTitle: 'Korean Bibimbap',
      isFavorite: false,
    ),
  ];
}

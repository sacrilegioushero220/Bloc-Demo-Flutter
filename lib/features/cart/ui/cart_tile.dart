import 'package:couter_app/features/cart/bloc/cart_bloc.dart';

import 'package:couter_app/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productDataModel.imageUrl))),
              height: 200,
              width: double.maxFinite,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              productDataModel.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(productDataModel.description),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "\$${productDataModel.price}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(
                        //   HomeProductWishListButtonClickedEvent(
                        //       clickedProduct: productDataModel),
                        // );
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(
                          CartRemoveFromCartEvent(
                              productDataModel: productDataModel),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart))
                ],
              )
            ]),
            const SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}

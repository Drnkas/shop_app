import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/models/cart.dart';
import '../models/product.dart';
import '../utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final product = Provider.of<Product>(context, listen: false);
   final cart = Provider.of<Cart>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton( //restringe a operação
              onPressed: () {
                product.toggleFavorite();
              },
              icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).primaryColor
            ),
          ),
          title: Text(
              product.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: (){
              cart.addItem(product);

            },
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).primaryColor,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_DETAIL,
              arguments: product
            );
          },
        ),
      ),
    );
  }
}

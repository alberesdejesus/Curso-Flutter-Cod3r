import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_grid_item.dart';
import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  ProductGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final products = showFavoriteOnly
        ? productsProvider.favoriteItems
        : productsProvider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductGridItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //quantos elementos no eixo
        childAspectRatio: 3 / 2, //aspecto da tela
        crossAxisSpacing: 10, //espaçament na linha cruzada
        mainAxisSpacing: 10, //espaçamento tbm
      ),
    );
  }
}

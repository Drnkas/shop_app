import 'package:flutter/cupertino.dart';
import '../data/dummy_data.dart';
import 'product.dart';

class ProductList with ChangeNotifier{
  List <Product> _items = dummyProducts;

  List<Product> get items => [..._items]; //clone da lista para te controle
  List<Product> get favoriteItems => _items.where((prod) => prod.isFavorite).toList(); //cria outra lista apenas com os favoritos


  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); //notifica
  }
}
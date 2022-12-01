import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/models/order_list.dart';
import 'package:shopp/models/product_list.dart';
import 'package:shopp/pages/cart_page.dart';
import 'package:shopp/pages/orders_page.dart';
import 'package:shopp/pages/product_detail_page.dart';
import 'package:shopp/pages/products_overview_page.dart';
import 'package:shopp/utils/app_routes.dart';

import 'models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.red,
        ),
        //home: ProductsOverviewPage(),
        routes: {
          AppRoutes.HOME: (ctx) => const ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
          AppRoutes.CART: (ctx) => const Cartpage(),
          AppRoutes.ORDERS: (ctx) => const OrdersPage()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
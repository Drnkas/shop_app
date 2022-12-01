import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/cart_item.dart';
import '../models/cart.dart';
import '../models/order_list.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("carrinho"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 25
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total: ',
                  style: TextStyle(
                    fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                      label: Text(
                          'R\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.purple
                        ),
                      )
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Provider.of<OrderList>(
                          context,
                          listen: false,
                        ).addOrder(cart);

                        cart.clear();
                      },
                      child: const Text('comprar')
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx, i) => CartItemWidget(items[i])
              ),
          )
        ],
      ),
    );
  }
}

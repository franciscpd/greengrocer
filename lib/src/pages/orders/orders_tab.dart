import 'package:flutter/material.dart';

import 'package:greengrocer/src/config/app_data.dart' as app_data;
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          OrderModel order = app_data.orders[index];

          return OrderTile(
            order: order,
          );
        },
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemCount: app_data.orders.length,
      ),
    );
  }
}

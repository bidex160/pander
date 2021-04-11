import 'package:flutter/material.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/pages/discover/widgets/laundry_section.dart';
import 'package:pander/features/booking/providers/order_items_page_provider.dart';

class OrderItemsPage extends StatefulWidget {
  final CategoryCard categoryCard;

  const OrderItemsPage({Key key, this.categoryCard}) : super(key: key);
  
  @override
  _OrderItemsPageState createState() => _OrderItemsPageState();
}

class _OrderItemsPageState extends State<OrderItemsPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<OrderItemsPageProvider>(
      child: null,
      model: OrderItemsPageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    
                  ],
                ),
                Hero(
                  tag: widget.categoryCard.title, 
                  child: Image(
                    image: AssetImage(widget.categoryCard.thumbnail)
                  ),
                )
              ],
            )
          ),
        );
      },
    );
  }
}
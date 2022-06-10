import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/user_product_itme.dart';
import '../widgets/app_drawer.dart';
import 'edit_product_screen.dart';
class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-producs';
  @override
  Widget build(BuildContext context) {
    final producsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
             icon: const Icon(Icons.add),
            onPressed: (){
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          },),
        ],
      ),
    drawer: AppDrawer(),
    body: Padding(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: producsData.items.length,
        itemBuilder: (_,i) => Column(children: [
          UserProductItme(
            producsData.items[i].id,
            producsData.items[i].title,
            producsData.items[i].imageUrl,
        ),
          Divider(),
        ],
        ),
    ),
    ),
    );
  }
}

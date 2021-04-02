import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/models/product.dart';
import 'package:unifarme/src/providers/selectedItem.dart';

import 'package:unifarme/src/screens/homepage/item/counter.dart';
import 'package:unifarme/src/screens/homepage/searchpage/productList.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;

  const ProductDetailsScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedProd = Provider.of<SelectedItemProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(blueVar),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.chevron_left,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                          ),
                          onPressed: () {
                            // Navigator.pushNamed(context, 'orderscreen'),
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Hero(
                        tag: '20',
                        child: Image.network(
                          selectedProd.getProduct.product_pic,
                          // "${productsList[id].img}",
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: double.infinity * 0.7,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          selectedProd.getProduct.product_name,
                          // "${productsList[id].title}",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.orange,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      """You will rarely want to do that unless you’re creating a widget similar to Scaffold. That’s where widgets such as IntrinsincHeight comes in handy. These widgets are able to solve the paradox, and therefore have a valid layout.
                      """,
                      // "${productsList[id].description}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(),
                        Text(
                          "₹ ${selectedProd.getProduct.price}",
                          // "${productsList[id].price}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            HexColor(blueVar),
                          ),
                        ),
                        child: Text(
                          "Add To Cart",
                          style: Theme.of(context).textTheme.button.apply(
                                color: Colors.white,
                              ),
                        ),
                        onPressed: () {},
                        // color: Colors.green,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(5.0),
                        // ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

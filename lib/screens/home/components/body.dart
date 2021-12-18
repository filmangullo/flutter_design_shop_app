import 'package:flutter/material.dart';
import 'package:flutter_online_shop/constants.dart';
import 'package:flutter_online_shop/models/Product.dart';
import 'package:flutter_online_shop/screens/details/details_screen.dart';
import 'package:flutter_online_shop/screens/home/components/categories.dart';
import 'package:flutter_online_shop/screens/home/components/item_card.dart';


// Staelees Widget for Heading
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Woman",
            style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Categories(),
        // const ItemCard()
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisSpacing: kDefaultPadding
                ),
                itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => DetailsScreen(product: products[index])
                    )
                    )
                )
            ),
          ),
        )
      ],
    );
  }
}


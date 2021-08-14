import 'package:ecommerce_app/screens/product_detail_screen.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        body: CustomScrollView(
          slivers: [
            const CustomAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _buildSearchBox(),
                  _buildProductsCategoryTitle("Popular Products"),
                  _buildPopularProductSection(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _buildProductsCategoryTitle("Recommended Products"),
                  _buildPopularProductSection(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _buildProductsCategoryTitle("Popular Products"),
                  _buildPopularProductSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _buildProductsCategoryTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "View All",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Align _buildPopularProductSection() {
    return Align(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const ProductDetailScreen(),
                  ),
                );
              },
              child: const ProductCard(),
            );
          },
        ),
      ),
    );
  }

  Container _buildSearchBox() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              color: Colors.white,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search in products",
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // color: const Color(0xffffd180),
              color: Colors.amber[800],
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () {
                  print("Searching...");
                },
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

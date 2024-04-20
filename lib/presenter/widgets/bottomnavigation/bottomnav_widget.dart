import 'package:flutter/material.dart';

class NavBottomWidget extends StatelessWidget {
  const NavBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            tabbarWidget(),
            TabBarView(
              children: [
                Container(
                    // child: Container(child: const FavoriteWidget()),
                    ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  // child: Container(child: const HomePage()),
                ),
                Container(child: const Icon(Icons.account_balance_wallet)),
                Container(child: const Icon(Icons.location_on_outlined)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget tabbarWidget() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset.zero,
                blurRadius: 1,
                spreadRadius: 2,
                blurStyle: BlurStyle.normal)
          ]),
      child: const TabBar(
        labelColor: Colors.green,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
        ),
        tabs: [
          Tab(
            icon: Icon(Icons.star_border),
          ),
          Tab(
            icon: Icon(Icons.assignment),
          ),
          Tab(
            icon: Icon(Icons.account_balance_wallet_rounded),
          ),
          Tab(
            icon: Icon(Icons.location_on_sharp),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/screens/cart_screen.dart';
import 'package:food_delivery/core/utils/app_colors.dart';
import 'package:food_delivery/widgets/product_body_tab.dart';
import 'package:food_delivery/core/utils/assets_manager.dart';

int tIndex = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      Tab(child: tabItem(AssetsManager.tab, 0)),
      Tab(child: tabItem(AssetsManager.tab1, 1)),
      Tab(child: tabItem(AssetsManager.tab2, 2)),
      Tab(child: tabItem(AssetsManager.tab3, 3)),
      Tab(child: tabItem(AssetsManager.tab4, 4)),
      Tab(child: tabItem(AssetsManager.tab2, 5)),
    ];

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetsManager.bk),
          ),
        ),
        child: DefaultTabController(
          length: 6,
          initialIndex: 0,
          child: Container(
            color: Colors.white.withOpacity(.6),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    titleSpacing: 10,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      'Hi Faramawy',
                      style: TextStyle(color: Colors.black),
                    ),
                    actions: const [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(AssetsManager.bk),
                      ),
                      SizedBox(width: 16),
                    ],
                    flexibleSpace: const FlexibleSpaceBar(
                      centerTitle: false,
                      titlePadding: EdgeInsets.only(bottom: 80, left: 10),
                      title: Text(
                        'What do you \nwant for dinner',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(150),
                      child: Container(
                        color: Colors.transparent,
                        child: TabBar(
                          tabs: tabs,
                          isScrollable: true,
                          indicatorColor: Colors.transparent,
                          onTap: (value) => setState(() => tIndex = value),
                          labelPadding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                        ),
                      ),
                    ),
                  ),
                ],
                body: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        'Recommended',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      const Expanded(
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ProductBodyTab(),
                            ProductBodyTab(),
                            ProductBodyTab(),
                            ProductBodyTab(),
                            ProductBodyTab(),
                            ProductBodyTab(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            iconSize: 30,
            currentIndex: currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) => setState(() => currentIndex = value),
            items: [
              bottomNavItem(AssetsManager.home),
              bottomNavItem(AssetsManager.search),
              const BottomNavigationBarItem(icon: Text(''), label: ''),
              bottomNavItem(AssetsManager.heart),
              bottomNavItem(AssetsManager.notification),
            ],
          ),
          Positioned(
            top: -25,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => const CartScreen(price: 0)));
              },
              backgroundColor: AppColors.primary,
              child: Image.asset(AssetsManager.bag1, width: 30, height: 30),
            ),
          ),
        ],
      ),
    );
  }

  bottomNavItem(String icon) => BottomNavigationBarItem(
      label: '',
      activeIcon: Image.asset(
        icon,
        width: 25,
        height: 25,
        color: Colors.black,
      ),
      icon: Image.asset(
        icon,
        width: 25,
        height: 25,
        color: Colors.grey.shade500,
      ));

  Widget tabItem(String icon, int tabIndex) => Container(
        width: 100,
        height: 40,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: tIndex == tabIndex ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.fromLTRB(36, 8, 36, 8),
        child: Image.asset(icon),
      );
}

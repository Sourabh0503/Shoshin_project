import 'package:flutter/material.dart';
import 'package:shoshin_assing_app/screens/all_offer.dart';
import 'package:shoshin_assing_app/screens/gifts.dart';
import 'package:shoshin_assing_app/screens/my_offer.dart';
import 'package:shoshin_assing_app/screens/side_drawer.dart';
import 'package:shoshin_assing_app/screens/upcoming_offer.dart';
import 'package:shoshin_assing_app/widgets/nav_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIcon = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 40, 169),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 40, 169),
        foregroundColor: Colors.white,
        actions: const [
          Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.wallet,
                    color: Color.fromARGB(255, 53, 40, 169),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Rs.450")
                ],
              ),
            ),
          )
        ],
        title: const Text("Hi Sourabh"),
      ),
      drawer: const SideDrawer(),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: NavIcon(
                        color: Colors.blue,
                        icon: Icons.local_offer_rounded,
                        title: "All Offers",
                        selected: currentIcon == 0),
                    onTap: () {
                      setState(() {
                        currentIcon = 0;
                      });
                    },
                  ),
                  GestureDetector(
                    child: NavIcon(
                        color: Colors.red,
                        icon: Icons.card_giftcard,
                        title: "Gifts",
                        selected: currentIcon == 1),
                    onTap: () {
                      setState(() {
                        currentIcon = 1;
                      });
                    },
                  ),
                  GestureDetector(
                    child: NavIcon(
                        color: const Color.fromARGB(255, 238, 214, 0),
                        icon: Icons.watch_later_outlined,
                        title: "Upcoming",
                        selected: currentIcon == 2),
                    onTap: () {
                      setState(() {
                        currentIcon = 2;
                      });
                    },
                  ),
                  GestureDetector(
                    child: NavIcon(
                        color: Colors.purple,
                        icon: Icons.check_circle_outline,
                        title: "My offers",
                        selected: currentIcon == 3),
                    onTap: () {
                      setState(() {
                        currentIcon = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (currentIcon == 0) const Expanded(child: AllOffers()),
            if (currentIcon == 1) const GiftScreen(),
            if (currentIcon == 2) const UpcomingScreen(),
            if (currentIcon == 3) const MyOfferScreen(),
          ],
        ),
      ),
    );
  }
}

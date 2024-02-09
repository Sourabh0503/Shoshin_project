import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 90, 75, 224),
                  Color.fromARGB(255, 53, 40, 169)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Icons.account_box_sharp,
                  size: 48,
                  color: Color.fromARGB(180, 255, 255, 255),
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Hello Sourabh",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: const Color.fromARGB(180, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(
                Icons.account_circle,
                size: 26,
                color: Color.fromARGB(255, 1, 47, 80),
              ),
              title: Text(
                "Account",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 1, 47, 80),
                    ),
              ),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(
                Icons.payment,
                size: 26,
                color: Color.fromARGB(255, 1, 47, 80),
              ),
              title: Text(
                "Payments",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 1, 47, 80),
                    ),
              ),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(
                Icons.attach_money_outlined,
                size: 26,
                color: Color.fromARGB(255, 1, 47, 80),
              ),
              title: Text(
                "Pay Outs",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 1, 47, 80),
                    ),
              ),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(
                Icons.logout,
                size: 26,
                color: Color.fromARGB(255, 1, 47, 80),
              ),
              title: Text(
                "Log Out",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 1, 47, 80),
                    ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

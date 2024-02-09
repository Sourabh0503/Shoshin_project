import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoshin_assing_app/providers/offers_provider.dart';
import 'package:shoshin_assing_app/widgets/more_item.dart';
import 'package:shoshin_assing_app/widgets/trending_item.dart';

class AllOffers extends ConsumerStatefulWidget {
  const AllOffers({Key? key}) : super(key: key);

  @override
  ConsumerState<AllOffers> createState() => _AllOffersState();
}

class _AllOffersState extends ConsumerState<AllOffers> {
  List<Offer> trendingOffer = [];
  List<Offer> moreOffer = [];

  void loadOffer() async {
    final String jsonString =
        await rootBundle.loadString("assets/dummy_tasks.json");
    final List<dynamic> jsonList = json.decode(jsonString);
    List<Offer> offers = [];
    offers = jsonList.map((e) => Offer.fromJson(e)).toList();
    setState(() {
      trendingOffer =
          offers.where((element) => true) /*element.isTrending*/ .toList();
      moreOffer =
          offers.where((element) => true) /*!element.isTrending*/ .toList();
    });
    return;
  }

  @override
  void initState() {
    super.initState();
    loadOffer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.local_fire_department_sharp, color: Colors.orange),
              SizedBox(width: 8),
              Text("Trending Offers",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (int i = 0; i < trendingOffer.length; i++)
                  TrendingItem(offer: trendingOffer[i])
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.dashboard, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                "More Offers",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < moreOffer.length; i++)
                    MoreItem(offer: moreOffer[i])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

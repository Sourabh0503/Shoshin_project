import 'package:flutter/material.dart';
import 'package:shoshin_assing_app/providers/offers_provider.dart';
import 'package:shoshin_assing_app/screens/offer_detail.dart';

class TrendingItem extends StatelessWidget {
  const TrendingItem({required this.offer, super.key});

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => OfferDeatilScreen(
                    offer: offer,
                  )));
        },
        child: Stack(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              height: 120,
              width: 120,
              child: Image.network(
                offer.customData.wallUrl,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 120,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer.brand.title,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    Text(
                      "Get ${offer.payoutCurrency} ${offer.payoutAmt}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.flash_on_rounded,
                          color: Colors.orange,
                          size: 10,
                        ),
                        Text(
                          offer.totalLead,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

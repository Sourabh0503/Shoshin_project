import 'package:flutter/material.dart';
import 'package:shoshin_assing_app/providers/offers_provider.dart';
import 'package:shoshin_assing_app/screens/offer_detail.dart';

class MoreItem extends StatelessWidget {
  const MoreItem({required this.offer, super.key});

  final Offer offer;

  Color parseColor(String colorHex) {
    // Remove the # symbol from the beginning of the hex string
    String hex = colorHex.replaceAll("#", "");
    // Parse the hex string to get the individual color components
    int value = int.parse("0xFF$hex");
    // Return a Color object with the parsed color value
    return Color(value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
            color: parseColor(offer.customData.dominantColor), width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 65,
              width: 65,
              child: Image.network(offer.brand.logo),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    offer.brand.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(40)),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) =>
                                    OfferDeatilScreen(offer: offer)));
                          },
                          child: Text(
                            "Get ${offer.payoutCurrency} ${offer.payoutAmt}",
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 12),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(
                            Icons.flash_on_rounded,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Text(
                            offer.totalLead,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

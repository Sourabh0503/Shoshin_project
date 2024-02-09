import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoshin_assing_app/providers/offers_provider.dart';
import 'package:shoshin_assing_app/providers/stepItem_provider.dart';

class OfferDeatilScreen extends StatefulWidget {
  const OfferDeatilScreen({super.key, required this.offer});
  final Offer offer;

  @override
  State<OfferDeatilScreen> createState() => _OfferDeatilScreenState();
}

class _OfferDeatilScreenState extends State<OfferDeatilScreen> {
  List<StepItem> _stepItems = [];

  Future<void> _loadStepItems() async {
    String jsonString =
        await rootBundle.loadString("assets/dummy_details.json");
    List<dynamic> jsonList = json.decode(jsonString);
    List<StepItem> stepItems =
        jsonList.map((e) => StepItem.fromJson(e)).toList();
    setState(() {
      _stepItems = stepItems;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadStepItems();
  }

  int currentIcon = 0;

  @override
  Widget build(BuildContext context) {
    int stepDone = _stepItems
        .where(
          (element) => element.isCompleted,
        )
        .length;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 40, 169),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 40, 169),
        foregroundColor: Colors.white,
        title: const Text("Offer Deatils"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Image.network(widget.offer.brand.logo),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.offer.brand.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.offer.shortDesc,
                            style: const TextStyle(fontSize: 12),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (widget.offer.customData.appRating.isNotEmpty)
                            Text(
                              "Rating: ${widget.offer.customData.appRating}/5",
                              style: const TextStyle(fontSize: 12),
                            )
                        ],
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 2, // Adjust the height of the line as needed
              color: const Color.fromARGB(
                  89, 158, 158, 158), // Set the color of the line
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "   Step($stepDone/${_stepItems.length})",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < _stepItems.length; i++)
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _stepItems[i].isCompleted
                                ? Colors.green
                                : _stepItems[i - 1].isCompleted
                                    ? Colors.orange
                                    : Colors.grey, // Border color
                            width: 2, // Border width
                          ),
                          borderRadius:
                              BorderRadius.circular(10), // Border radius
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Row(
                            children: [
                              Icon(
                                _stepItems[i].isCompleted
                                    ? Icons.check_circle
                                    : Icons.hourglass_bottom,
                                color: _stepItems[i].isCompleted
                                    ? Colors.green
                                    : _stepItems[i - 1].isCompleted
                                        ? Colors.orange
                                        : Colors.grey,
                              ),
                              Text(
                                _stepItems[i].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: _stepItems[i].isCompleted
                                      ? Colors.green
                                      : _stepItems[i - 1].isCompleted
                                          ? Colors.orange
                                          : Colors.grey,
                                  borderRadius: BorderRadius.circular(
                                      10), // Border radius
                                ),
                                child: Text(
                                  "${_stepItems[i].payoutCurrency} ${_stepItems[i].payoutAmt}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          !_stepItems[i].isCompleted
                              ? _stepItems[i - 1].isCompleted
                                  ? Text(_stepItems[i].description)
                                  : Container()
                              : Container(),
                        ]), // Replace YourChildWidget with your actual content
                      )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.flash_on_rounded,
                  color: Colors.orange,
                  //size: 10,
                ),
                Text(
                  '${widget.offer.totalLead} user have already participated',
                  style: const TextStyle(color: Colors.orange),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    const Color.fromARGB(255, 53, 40, 169), // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              child: Center(
                child: Text(
                    'Get ${widget.offer.payoutCurrency} ${widget.offer.payoutAmt} '),
              ), // Button text
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

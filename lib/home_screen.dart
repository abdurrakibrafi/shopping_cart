import 'package:flutter/material.dart';
import 'package:shopping_cart/card_data.dart';
import 'package:shopping_cart/constant.dart';

class HomeCartScreen extends StatefulWidget {
  HomeCartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeCartScreen> createState() => _HomeCartScreenState();
}

class _HomeCartScreenState extends State<HomeCartScreen> {
  @override
  void initState() {
    super.initState();
  }

  double updateTotalAmount() {
    double totalAmount = 0;
    for (var cardData in cardDataList) {
      totalAmount += (cardData.price * cardData.quantity);
    }
    return totalAmount;
  }

  void decrementQuantity(int index) {
    setState(() {
      if (cardDataList[index].quantity > 1) {
        cardDataList[index].quantity--;
        updateTotalAmount();
      }
    });
  }

  void incrementQuantity(int index) {
    // Increase the quantity of the item at the given index
    setState(() {
      cardDataList[index].quantity++;
      updateTotalAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                'My Bag',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cardDataList.length,
              itemBuilder: (BuildContext context, int index) {
                final cardData = cardDataList[index];
                var quantityValue = cardData.price * cardData.quantity;

                return Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Image.network(
                                    cardData.imageUrl,
                                    fit: BoxFit.fill,
                                    height: 140,
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cardData.productName,
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            Text.rich(TextSpan(
                                                text: 'Color:',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                                children: <InlineSpan>[
                                                  TextSpan(
                                                    text: cardData.color,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ])),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text.rich(TextSpan(
                                                text: 'Size:',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                                children: <InlineSpan>[
                                                  TextSpan(
                                                    text: cardData.size,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ])),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                decrementQuantity(index);
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.grey,
                                                size: 20,
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                padding: EdgeInsets.all(15),
                                                backgroundColor: Colors.white,
                                                foregroundColor: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              cardData.quantity.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                incrementQuantity(index);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.grey,
                                                size: 20,
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                padding: EdgeInsets.all(15),
                                                backgroundColor: Colors.white,
                                                foregroundColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      children: [
                                        Icon(Icons.more_vert,
                                            color: Colors.grey, size: 35),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${quantityValue}\$',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  '${updateTotalAmount()}\$',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: Colors.redAccent),
                    onPressed: () {
                      Constant.showSnackbar(context);
                    },
                    child: Text(
                      "CheckOut ",
                      style: TextStyle(fontSize: 18),
                    )))
          ],
        ),
      ),
    );
  }
}

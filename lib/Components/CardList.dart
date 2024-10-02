import 'package:expense_manager_application/Components/CardView.dart';
import 'package:expense_manager_application/Model/CardModel.dart';
import 'package:expense_manager_application/Pages/CardViewPage.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final List<CardModel> cards;

  const CardList({required Key key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal, children: getChaildrenCards(context));
  }

  List<Widget> getChaildrenCards(context) {
    return cards
        .map((card) => GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  var key = null;
                  return CardViewPage(
                    card: card,
                    key: key,
                  );
                }));
              },
              child: CardView(card),
            ))
        .toList();
  }
}

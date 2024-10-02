import 'package:expense_manager_application/Components/CardList.dart';
import 'package:expense_manager_application/Components/TransactionView.dart';
import 'package:expense_manager_application/Model/TransactionModel.dart';
import 'package:expense_manager_application/Pages/AddCardPage.dart';
import 'package:expense_manager_application/Providers/CardProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<CardProvider>(
        create: (context) => newMethod(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home: HomePage(),
        ),
      ),
    );

CardProvider newMethod() => CardProvider();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var id = null;
    var id2 = null;
    var key = null;
    var key2 = null;
    var id3 = null;
    var key3 = null;
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        title: Text(
          "Home page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        elevation: 0,
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black45,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCardPage()));
            },
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              (Provider.of<CardProvider>(context).getCardLength() > 0
                  ? Container(
                      height: 210,
                      child: Consumer<CardProvider>(
                        builder: (context, cards, child) {
                          var key4 = null;
                          return CardList(
                            cards: cards.allCards,
                            key: key4,
                          );
                        },
                      ))
                  : Container(
                      height: 210,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Add your new card click the \n + \n button in the top right.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )),
              SizedBox(
                height: 30,
              ),
              Text(
                "Last Transactions",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              SizedBox(
                height: 15,
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Shopping',
                    price: 1000,
                    type: '-',
                    currency: 'US',
                    id: id),
                key: key2,
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Salary',
                    price: 1000,
                    type: '+',
                    currency: 'US',
                    id: id2),
                key: key,
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Receive',
                    price: 200,
                    type: '+',
                    currency: 'US',
                    id: id3),
                key: key3,
              )
            ],
          ),
        ),
      ),
    );
  }
}

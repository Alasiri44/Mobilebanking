import 'package:flutter/material.dart';

// Sample data for the accounts and cards
class Account {
  final String accountName;
  final List<CardInfo> cards;

  Account({required this.accountName, required this.cards});
}

class CardInfo {
  final String cardNumber;
  final String cardType;

  CardInfo({required this.cardNumber, required this.cardType});
}

class AccountsPage extends StatelessWidget {
  AccountsPage(
    {super.key});
  // The list of accounts and cards should not be const.
  final List<Account> accounts = [
    Account(
      accountName: "Personal Account",
      cards: [
        CardInfo(cardNumber: "**** **** **** 1234", cardType: "Visa"),
        CardInfo(cardNumber: "**** **** **** 5678", cardType: "MasterCard"),
      ],
    ),
    Account(
      accountName: "Business Account",
      cards: [
        CardInfo(cardNumber: "**** **** **** 9876", cardType: "Visa"),
      ],
    ),
    Account(
      accountName: "Savings Account",
      cards: [
        CardInfo(cardNumber: "**** **** **** 1122", cardType: "MasterCard"),
      ],
    ),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            final account = accounts[index];
            return AccountCard(account: account);
          },
        ),
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  final Account account;

  const AccountCard({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              account.accountName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: account.cards.map((card) {
                return CardInfoWidget(card: card);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInfoWidget extends StatelessWidget {
  final CardInfo card;

  const CardInfoWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        card.cardType == "Visa" ? Icons.credit_card : Icons.account_balance_wallet,
        color: Colors.blue,
      ),
      title: Text(
        card.cardType,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(card.cardNumber),
    );
  }
}
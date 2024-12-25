// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:bank/screens/paybills.dart';
import 'package:bank/screens/sendmoney.dart';
import 'package:bank/screens/settings.dart';
import 'package:bank/screens/withdraw.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  // Pages for navigation
  final List<Widget> _pages = [
    DashboardScreen(),
    AccountsScreen(),
    SettingsPage(), // Ensure SettingsPage is included in the list
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the index when a tab is selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF87CEEB),
      appBar: AppBar(
         title: Text(
          _selectedIndex == 0
              ? 'Dashboard' // Display 'Dashboard' when selected index is 0
              : _selectedIndex == 1
                  ? 'Accounts' // Display 'Accounts' when selected index is 1
                  : 'Settings', // Display 'Settings' when selected index is 2
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: _selectedIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(16.0), // Adds padding around the body
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _greetUser(),
                  const SizedBox(height: 20), // Adds space between widgets

                  // Account Balance Container
                  _accountBalance(),
                  const SizedBox(height: 40), // Adds space after account balance

                  // Row to center the buttons horizontally
                  _paymentType(context),
                ],
              ),
            )
          : _pages[_selectedIndex], // Show the corresponding page when selected
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Accounts',
            
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            
          ),
        ],
      ),
    );
  }

  // Greeting text widget
  Widget _greetUser() {
    return const SizedBox(
      child: Text(
        'Good morning, Austin', // Greeting text
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold, // Bold font for the greeting
        ),
      ),
    );
  }

  // Account Balance Container
  Widget _accountBalance() {
    return Container(
      padding: const EdgeInsets.all(16), // Adds padding inside the container
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueAccent, // Background color for the container
        borderRadius: BorderRadius.circular(12), // Rounded corners for the container
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start of the column
        children: [
          Text(
            'Account Balance', // Label for account balance
            style: TextStyle(
              color: Colors.white, // White color for the label
              fontSize: 18, // Font size for the label
            ),
          ),
          SizedBox(height: 10), // Adds space between label and balance
          Text(
            '\$12,345.67', // Account balance amount
            style: TextStyle(
              color: Colors.white, // White color for the balance
              fontSize: 32, // Font size for the balance amount
              fontWeight: FontWeight.bold, // Bold font for the balance amount
            ),
          ),
        ],
      ),
    );
  }

  // Row to center the buttons horizontally
  Widget _paymentType(BuildContext context) {
    return  Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding( 
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
              spacing: 8, // Horizontal spacing between items
              runSpacing: 20, // Vertical spacing between rows
              alignment: WrapAlignment.start,  
                 
                  
                   // Distribute buttons evenly
                  children: [
                    // Send Money Button
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SendMoneyPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(80, 80), // Mimic bottom navigation item size
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 50,                        
                            decoration: BoxDecoration(
                              color: Colors.white, 
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.send, size: 28, color: Colors.blue)),
                          const SizedBox(height: 4),
                          Text('Send', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10), // Adds space between buttons
                    
                    // Pay Bills Button
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PayBillsPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(80, 80),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 50,                        
                            decoration: BoxDecoration(
                              color: Colors.white, 
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.account_balance_wallet, size: 28, color: Colors.blue)),
                          const SizedBox(height: 4),
                          Text('Pay Bills', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10), // Adds space between buttons
                    // Withdraw Button
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WithdrawScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(80, 80),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 50,                        
                            decoration: BoxDecoration(
                              color: Colors.white, 
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.attach_money, size: 28, color: Colors.blue)),
                          const SizedBox(height: 4),
                          Text('Withdraw', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SendMoneyPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(80, 80), // Mimic bottom navigation item size
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 50,                        
                            decoration: BoxDecoration(
                              color: Colors.white, 
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.send_to_mobile, size: 28, color: Colors.blue)),
                          const SizedBox(height: 4),
                          Text('Mobile\nrecharge', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WithdrawScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(80, 80),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 50,                        
                            decoration: BoxDecoration(
                              color: Colors.white, 
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.credit_card, size: 28, color: Colors.blue)),
                          const SizedBox(height: 4),
                          Text('Credit\ncard', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WithdrawScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(80, 80),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 50,                        
                            decoration: BoxDecoration(
                              color: Colors.white, 
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.bar_chart, size: 28, color: Colors.blue)),
                          const SizedBox(height: 4),
                          Text('Transaction\nreport', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WithdrawScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(80, 80),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 50,                        
                            decoration: BoxDecoration(
                              color: Colors.white, 
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.payment, size: 28, color: Colors.blue)),
                          const SizedBox(height: 4),
                          Text('Buy goods\nand services', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    
                    
                    
                  ],
                
              ),
                        ),
            ),
    );
      
    
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Dashboard Page'));
  }
}

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Accounts Page'));
  }
}

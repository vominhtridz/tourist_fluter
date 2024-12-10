import 'package:flutter/material.dart';

class Screen10 extends StatelessWidget {
  const Screen10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/caurong.png',
              width: 375,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // 'Chat' Text
                      Text(
                        'Chat',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search chat',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/tuantran.png'),
                          radius: 25,
                        ),
                        title: Text('Tuan Tran'),
                        subtitle: Text("It's a beautiful place"),
                        trailing: Text('10:30 AM'),
                      ),
                      Divider(),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/emmy.png'),
                          radius: 25,
                        ),
                        title: Text('Emmy'),
                        subtitle: Text("We can start at 8am"),
                        trailing: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/khai.png'),
                          radius: 25,
                        ),
                        title: Text('Khai Ho'),
                        subtitle: Text('See you tomorrow'),
                        trailing: Text('11:30 AM'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 16,
            child: IconButton(
              iconSize: 30,
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
              },
            ),
          ),
        ],
      ),
      // Adding the BottomNavigationBar here
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00CEA6), // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
        currentIndex: 2, // Make sure 'Chat' is selected
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'Chat'), // 'Chat' label
          BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

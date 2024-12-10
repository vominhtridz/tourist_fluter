import 'package:flutter/material.dart';

class Screen8 extends StatelessWidget {
  const Screen8({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/images/danang.png',
              fit: BoxFit.cover,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'My Trips',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    _buildTab('Current Trips'),
                    _buildTab('Next Trips', isSelected: true),
                    _buildTab('Past Trips'),
                    _buildTab('Wish List'),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _buildTripCard(
              'Ho Guom Trip',
              'Hanoi, Vietnam',
              'Feb 2, 2020',
              '8:00 - 10:00',
              'Emmy',
              'assets/images/hokiem.png',
              'assets/images/emmy.png',
            ),
            _buildTripCard(
              'Ho Chi Minh Mausoleum',
              'Hanoi, Vietnam',
              'Feb 2, 2020',
              '8:00 - 10:00',
              'Emmy',
              'assets/images/lang.png',
              'assets/images/emmy.png',
            ),
            _buildTripCard(
              'Duc Ba Church',
              'Ho Chi Minh, Vietnam',
              'Feb 2, 2020',
              '8:00 - 10:00',
              'Waiting for offers',
              'assets/images/nhatho.png',
              'assets/images/emmy.png',
            ),
            // Thêm khoảng trống ở cuối
            SizedBox(height: 100),
          ]),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      backgroundColor: const Color(0xFF00CEA6),
      child: const Icon(Icons.add),
    ),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF00CEA6),
      unselectedItemColor: Colors.grey,
      currentIndex: 1,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'My Trips'),
        BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
    ),
  );
}

  Widget _buildTab(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF00CEA6) : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTripCard(
    String title,
    String location,
    String date,
    String time,
    String person,
    String backgroundImage,
    String avatarImage, {
    bool showStatus = false,
    String status = '',
    bool showExtraParticipants = false,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  backgroundImage,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                              bottom: 10,
                              left: 10,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, color: Colors.white, size: 20),
                                  SizedBox(width: 4),
                                  Text(
                                    'Hanoi, Vietnam',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
              if (showStatus)
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      status,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(Icons.calendar_today_outlined, date),
                      _buildInfoRow(Icons.access_time, time),
                      _buildInfoRow(Icons.person_outline, person),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF00CEA6), width: 2),
                      ),
                      child: ClipOval(
                        child: Image.asset(avatarImage, fit: BoxFit.cover),
                      ),
                    ),
                    if (showExtraParticipants)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF00CEA6),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '+3',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                _buildButton(Icons.info_outline, 'Detail'),
                const SizedBox(width: 8),
                _buildButton(Icons.chat_bubble_outline, 'Chat'),
                const SizedBox(width: 8),
                _buildButton(Icons.payment, 'Pay'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, String label) {
    return Expanded(
      child: OutlinedButton.icon(
        icon: Icon(icon, size: 16),
        label: Text(label),
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF00CEA6),
          side: const BorderSide(color: Color(0xFF00CEA6)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
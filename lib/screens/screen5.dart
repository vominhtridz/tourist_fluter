import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black, size: 35,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 220),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('Where you want to explore', style: TextStyle(color: Colors.grey, fontSize: 17),),
                  ),
                ),
                SizedBox(height: 30,),
                Text('Popular destinations'),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 1),
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Danang, Vietnam'),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 1)
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Ho Chi Minh, Vietnam'),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 7,
                        offset: Offset(0, 1),
                        spreadRadius: 1,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Venice, Italy'),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomKeyboard(),
          ),
        ],
      ),
    );
  }
}

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  Widget _buildKey(String label, {double? width, Color color = Colors.white}) {
    return Expanded(
      flex: width != null ? width.toInt() : 1,
      child: Container(
        height: 50,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Center(child: Text(label, style: TextStyle(fontSize: 16))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Change background to white
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: 'QWERTYUIOP'.split('').map((e) => _buildKey(e)).toList(),
          ),
          Row(
            children: 'ASDFGHJKL'.split('').map((e) => _buildKey(e)).toList(),
          ),
          Row(
            children: [
              _buildKey('⇧', width: 1.5, color: Color(0xFFE5E7EB)),
              ...'ZXCVBNM'.split('').map((e) => _buildKey(e)).toList(),
              _buildKey('⌫', width: 1.5, color: Color(0xFFE5E7EB)),
            ],
          ),
          Row(
            children: [
              _buildKey('123', width: 1.5, color: Color(0xFFE5E7EB)),
              _buildKey('😊', width: 1.5, color: Color(0xFFE5E7EB)),
              _buildKey('space', width: 5),
              _buildKey('Search', width: 2, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // or center if you prefer
          mainAxisSize: MainAxisSize.min, // to wrap content tightly
          children: [
            Text(
              'صباح الخير',
              style: TextStyle(
                fontSize: 12, // smaller font size
                color: Colors.black, // lighter color for subtitle effect
              ),
            ),
            Text(
              'اسلام ',
              style: TextStyle(
                fontSize: 20, // default or larger font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.power_settings_new), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              color: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('رصيد الحساب', style: TextStyle(color: Colors.white)),
                  Text('00000 ريال', style: TextStyle(color: Colors.white, fontSize: 24)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('EASY', style: TextStyle(color: Colors.white)),
                      SizedBox(width: 10),
                      Icon(Icons.flag, color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true, // Helps to fit grid into column
              physics: NeverScrollableScrollPhysics(),
              children: [
                buildCard('استلام حوالة', Icons.attach_money),
                buildCard('السداد', Icons.category),
                buildCard('سداد المياة', Icons.info),
              ],
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.green[200],
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Text('اشتري وادفع بضغطة زر', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('جهات الاتصال', style: TextStyle(fontSize: 18)),
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                    IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                    // Add more icons here if needed
                  ],
                ),
              ],
            ),

            Wrap(
              spacing: 20,
              children: [
                buildContact('شخص1', Icons.person),
                buildContact('شخص2', Icons.person),
                buildContact('شخص3', Icons.person),
              ],
            ),
            SizedBox(height: 20),
            Text('آخر المعاملات', style: TextStyle(fontSize: 18)),
            // List of transactions
            buildTransaction('2021-05-07', 'اليوم', '5:54 م', 'YER 2000'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضلة'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'جهات الاتصال'),
        ],
      ),
    );
  }

  Widget buildCard(String title, IconData icon) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30),
          SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }

  Widget buildContact(String name, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          child: Icon(icon),
        ),
        SizedBox(height: 8),
        Text(name),
      ],
    );
  }

  Widget buildTransaction(String date, String status, String time, String amount) {
    return Card(
      child: ListTile(
        title: Text(date),
        subtitle: Text('$status - $time'),
        trailing: Text(amount),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:librarybook/page/BND_page.dart';
import 'package:librarybook/page/EUR_page.dart';
import 'package:librarybook/page/GBP_page.dart';
import 'package:librarybook/page/KR_page.dart';
import 'package:librarybook/page/SGD_page.dart';
import 'package:librarybook/page/USD_page.dart';
import 'package:librarybook/page/VND_page.dart';
import 'package:librarybook/page/japan_page.dart';
import 'package:librarybook/page/lao_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'แปลงสกุลเงิน',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        color: Colors.green[200],
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 2.5,
          children: [
            _buildCurrencyCard('assets/images/japan.png', 'เยน', 'JPY', JapanPage()),
            _buildCurrencyCard('assets/images/USD.png', 'ดอลลาร์สหรัฐ', 'USD', USDPage()),
            _buildCurrencyCard('assets/images/euro.png', 'ยูโร', 'EUR', EURPage()),
            _buildCurrencyCard('assets/images/lao.png', 'กีบ', 'LAK', LaoPage()),
            _buildCurrencyCard('assets/images/korea.png', 'วอน', 'KRW', KoreaPage()),
            _buildCurrencyCard('assets/images/GBP.png', 'ปอนด์สเตอร์ลิง', 'GBP', GBPPage()),
            _buildCurrencyCard('assets/images/SGD.png', 'ดอลลาร์สิงคโปร์', 'SGD', SGDPage()),
            _buildCurrencyCard('assets/images/VND.png', 'ดงเวียดนาม', 'VND', VNDPage()),
            _buildCurrencyCard('assets/images/BND.png', 'ดอลลาร์บรูไน', 'BND', BNDPage()),

          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyCard(String imagePath, String currencyName, String gender, Widget page) {
    bool isVisible = _selectedFilter == 'All' || gender == _selectedFilter;

    return IgnorePointer(
      ignoring: !isVisible, // ปิดการรับ Input ถ้า Card ถูกซ่อน
      child: Visibility(
        visible: isVisible,

        child: Card(
          color: Colors.grey[300],
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(imagePath, width: 170.0, height: 140.0, fit: BoxFit.cover),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\n'),
                        Text(currencyName, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text(gender),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

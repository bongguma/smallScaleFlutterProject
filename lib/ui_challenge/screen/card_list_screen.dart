import 'package:flutter/material.dart';
import 'package:smallscaleflutterproject/ui_challenge/widget/custom_button_widget.dart';
import 'package:smallscaleflutterproject/ui_challenge/widget/currency_card_widget.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen({Key? key}) : super(key: key);

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xFF181818),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hey, Yejin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                '\$5 194 482', // '\' : 문자 그자체를 출력
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(
                    text: 'Transfer',
                    backgroundColor: Colors.amber,
                    textColor: Colors.black,
                  ),
                  CustomButtonWidget(
                    text: 'Request',
                    backgroundColor: const Color(0xFF1F2123),
                    textColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wallets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const CurrencyCardWidget(
                name: 'Euro',
                code: 'EUR',
                amount: '6 428',
                icon: Icons.euro_rounded,
                isInverted: false,
              ),
              Transform.translate(
                offset: Offset(0, -35),
                child: const CurrencyCardWidget(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 785',
                  icon: Icons.currency_bitcoin_rounded,
                  isInverted: true,
                ),
              ),
              Transform.translate(
                offset: Offset(0, -70),
                child: const CurrencyCardWidget(
                  name: 'Dollar',
                  code: 'USD',
                  amount: '428',
                  icon: Icons.attach_money_rounded,
                  isInverted: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

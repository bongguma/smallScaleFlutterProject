import 'package:flutter/material.dart';

class CurrencyCardWidget extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;

  final blackColor = const Color(0xFF1F2123);

  const CurrencyCardWidget({
    Key? key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : blackColor,
        borderRadius: BorderRadius.circular(25),
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: isInverted ? blackColor : Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        fontSize: 20,
                        color: isInverted ? blackColor : Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      code,
                      style: TextStyle(
                        fontSize: 20,
                        color: isInverted ? blackColor : Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 2.2,
              child: Transform.translate(
                offset: Offset(4, 12),
                child: Icon(
                  icon,
                  color: isInverted ? blackColor : Colors.white,
                  size: 88,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

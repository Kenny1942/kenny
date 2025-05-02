import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 170,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: const Color.fromARGB(255, 90, 85, 85),
              width: 0,
            ),
          ),
          child: Row(
            children: const [
              Text(
                '  Small   I    Medium   I    Large',
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ],
          ),
        ),
        const SizedBox(width: 93),
        InkWell(
          onTap: () {
            setState(() {
              if (quantity > 1) quantity--;
            });
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: const Color.fromARGB(255, 90, 85, 85), width: 0),
            ),
            child: const Center(
              child: Text(
                '-',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '$quantity',
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {
            setState(() {
              quantity++;
            });
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: const Color.fromARGB(255, 90, 85, 85), width: 0),
            ),
            child: const Center(
              child: Text(
                '+',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

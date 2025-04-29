import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      constraints: BoxConstraints(minHeight: 300),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 21, 10, 10).withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(66, 162, 15, 15),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Moglis Cup',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Strawberry ice cream'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Precio: \$8888.99', style: TextStyle(fontSize: 20)),
              Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red),
                  SizedBox(width: 4),
                  Text('120'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

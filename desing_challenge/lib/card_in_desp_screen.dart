import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String icon;
  final String likes;
  final String coin;

  const DescriptionCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
    required this.likes,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints(minHeight: 328),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color.fromARGB(255, 90, 85, 85),
            width: 0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.favorite,
                    color: const Color.fromARGB(255, 208, 180, 179)),
                SizedBox(width: 4),
                Text(
                  likes,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Center(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            SizedBox(height: 8),
            Center(
                child:
                    Text(description, style: TextStyle(color: Colors.white30))),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/eeee.png',
                  width: 15,
                  height: 15,
                ),
                Text(price,
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Ingredients                     Reviews',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  ' ',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Image.asset(
                  'assets/images/Mask group.png',
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 8),
                Image.asset(
                  'assets/images/Mask group1.png',
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 8),
                Image.asset(
                  'assets/images/Mask group2.png',
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 8),
                Image.asset(
                  'assets/images/Gluten 1.png',
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 70),
                Image.asset(
                  'assets/images/StarFilled.png',
                  width: 18,
                  height: 18,
                ),
                SizedBox(width: 8),
                Image.asset(
                  'assets/images/StarFilled.png',
                  width: 18,
                  height: 18,
                ),
                SizedBox(width: 8),
                Image.asset(
                  'assets/images/StarFilled.png',
                  width: 18,
                  height: 18,
                ),
                SizedBox(width: 8),
                Image.asset(
                  'assets/images/StarFilled.png',
                  width: 18,
                  height: 18,
                ),
                SizedBox(width: 8),
                Image.asset(
                  'assets/images/StarFilled.png',
                  width: 18,
                  height: 18,
                ),
                SizedBox(width: 10),
                Text(
                  '5.0',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ],
        ));
  }
}

// class GlassContainer extends StatelessWidget {
//   final Widget child;
//   final double borderRadius;
//   final double blur;
//   final EdgeInsets padding;

//   const GlassContainer({
//     super.key,
//     required this.child,
//     this.borderRadius = 20,
//     this.blur = 10,
//     this.padding = const EdgeInsets.all(16),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(borderRadius),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
//         child: Container(
//           padding: padding,
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(borderRadius),
//             border: Border.all(color: Colors.white.withOpacity(0.2)),
//           ),
//           child: child,
//         ),
//       ),
//     );
//   }
// }

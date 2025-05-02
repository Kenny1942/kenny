import 'package:desing_challenge/card_in_desp_screen.dart';
import 'package:desing_challenge/my_card2.dart';
import 'package:desing_challenge/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
//import 'package:desing_challenge/quantity_selector.dart';

class MainContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final String icon;
  final String likes;
  final String coin;

  const MainContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
    required this.likes,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: const Color.fromARGB(0, 91, 91, 78),
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.85,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 21, 19, 19),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      //
                      Positioned(
                        top: -100,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          imagePath,
                          height: 380,
                          fit: BoxFit.cover,
                        ),
                      ),
                      //
                      Positioned(
                        top: 190,
                        left: 20,
                        right: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: DescriptionCard(
                              description: description,
                              likes: likes,
                              price: price,
                              title: title,
                              icon: icon,
                              coin: coin,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 130,
                        left: 20,
                        child: QuantitySelector(),
                      ),

                      Positioned(
                        bottom: 60,
                        left: 20,
                        child: Container(
                          width: 360,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.07, 0.61, 1.0],
                              colors: [
                                Color.fromARGB(255, 146, 50, 103),
                                Color.fromARGB(255, 134, 47, 158),
                                Color.fromARGB(255, 89, 48, 80),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF8C5BEA).withOpacity(0.5),
                                offset: Offset(0, 6),
                                blurRadius: 12,
                                spreadRadius: 1,
                              ),
                            ],
                            border: Border.all(
                              color: const Color.fromARGB(255, 90, 85, 85),
                              width: 0, //
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Add to order for 8,99',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
            });
      },
      child: Container(
        width: 190,
        height: 290,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.07, 0.61, 1.0],
            colors: [
              Color.fromARGB(255, 120, 115, 115),
              Color(0xFF908CF5),
              Color(0xFF8C5BEA),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(179, 241, 233, 233),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Image.asset(
                      coin,
                      width: 12,
                      height: 12,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.favorite,
                      color: const Color.fromARGB(255, 243, 234, 234),
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      likes,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class QuantitySelector extends StatefulWidget {
//   const QuantitySelector({Key? key}) : super(key: key);

//   @override
//   _QuantitySelectorState createState() => _QuantitySelectorState();
// }

// class _QuantitySelectorState extends State<QuantitySelector> {
//   int quantity = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       bottom: 130,
//       left: 20,
//       child: Row(
//         children: [
//           Container(
//             width: 170,
//             height: 30,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(9),
//               border: Border.all(
//                 color: const Color.fromARGB(255, 90, 85, 85),
//                 width: 0,
//               ),
//             ),
//             child: Row(
//               children: [
//                 Text(
//                   '  Small   I    Medium   I    Large',
//                   style: TextStyle(color: Colors.white, fontSize: 11),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: 93),

//           // Botón "-" (decrementar)
//           InkWell(
//             onTap: () {
//               setState(() {
//                 if (quantity > 1) quantity--;
//               });
//             },
//             borderRadius: BorderRadius.circular(15),
//             child: Container(
//               width: 30,
//               height: 30,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(
//                     color: Color.fromARGB(255, 90, 85, 85), width: 0),
//               ),
//               child: Center(
//                 child: Text(
//                   '-',
//                   style: TextStyle(color: Colors.white, fontSize: 17),
//                 ),
//               ),
//             ),
//           ),

//           SizedBox(width: 10),

//           // Número
//           Text(
//             '$quantity',
//             style: TextStyle(color: Colors.white, fontSize: 17),
//           ),

//           SizedBox(width: 15),

//           // Botón "+" (incrementar)
//           InkWell(
//             onTap: () {
//               setState(() {
//                 quantity++;
//               });
//             },
//             borderRadius: BorderRadius.circular(15),
//             child: Container(
//               width: 30,
//               height: 30,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(
//                     color: Color.fromARGB(255, 90, 85, 85), width: 0),
//               ),
//               child: Center(
//                 child: Text(
//                   '+',
//                   style: TextStyle(color: Colors.white, fontSize: 17),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

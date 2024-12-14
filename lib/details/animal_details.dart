import 'package:animals_app/custom_appbar/appbar_widget.dart';
import 'package:animals_app/home.dart';
import 'package:flutter/material.dart';

class AnimalDetails extends StatelessWidget {
  final Animal animal;
  const AnimalDetails({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF285555),
      appBar: const MyAppBar(isDetailsPage: true),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [cardDetails(size), descriptionWidget(size)],
        ),
      ),
    );
  }

  Widget cardDetails(Size size) {
    double imageContainerHeight = size.height * 0.55;

    return SizedBox(
      width: size.width,
      height: imageContainerHeight,
      child: Stack(
        children: [
          Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                  height: 200,
                  width: size.width * 0.6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1f4949),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24)),
                  ))),
          Positioned(
              bottom: 0,
              right: 0,
              left: 50,
              child: Container(
                width: size.width * 0.5,
                height: imageContainerHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(animal.altImage),
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                    )),
              )),
          Positioned(
              top: 16,
              left: 16,
              right: 60,
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Text(animal.name,
                    style: const TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              )),
          Positioned(
              left: 16,
              right: size.width * 0.7,
              bottom: 0,
              child: SizedBox(
                child: Text("#${animal.id}",
                    style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              )),
        ],
      ),
    );
  }

  Widget descriptionWidget(Size size) {
    double descriptionContainerHeight = size.height * 0.28;

    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: SizedBox(
        height: descriptionContainerHeight,
        child: Column(
          children: [
            Expanded(
              child: Text(animal.description,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                        ))),
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        ))),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xFFf67913)),
                      minimumSize:
                          WidgetStateProperty.all(Size(size.width * 0.5, 40)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                  child: const Text(
                    "Leer Más",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

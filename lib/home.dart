import 'package:animals_app/animal_card/animal_card.dart';
import 'package:animals_app/custom_appbar/appbar_widget.dart';
import 'package:flutter/material.dart';

class Animal {
  final int id;
  final String name;
  final String image;
  final String sound;
  final String description;
  final String altImage;

  Animal(
      {required this.id,
      required this.name,
      required this.image,
      required this.sound,
      required this.description,
      required this.altImage});
}

class AnimalsApp extends StatefulWidget {
  const AnimalsApp({super.key});

  @override
  State<AnimalsApp> createState() => _AnimalsAppState();
}

class _AnimalsAppState extends State<AnimalsApp> {
  final List<Animal> animals = [
    Animal(
        id: 1,
        name: "Pajaro",
        image: "assets/images/bird.jpg",
        sound: "assets/audios/bird.wav",
        description:
            "Los pájaros son los únicos animales con plumas, ¡y algunas especies pueden volar a más de 100 km/h! Además, usan sus cantos para hablar entre ellos o para llamar la atención de otros pájaros.",
        altImage: "assets/images/bird_2.png"),
    Animal(
        id: 2,
        name: "Gato",
        image: "assets/images/cat.jpg",
        sound: "assets/audios/cat.wav",
        description:
            "Los gatos pasan la mitad de su día durmiendo y son muy ágiles porque tienen un esqueleto flexible. Pueden saltar hasta seis veces su altura.",
        altImage: "assets/images/cat_2.png"),
    Animal(
        id: 3,
        name: "Vaca",
        image: "assets/images/cow.jpg",
        sound: "assets/audios/cow.wav",
        description:
            "Las vacas tienen cuatro estómagos que les ayudan a digerir el pasto. También tienen muy buena memoria, recuerdan caras y lugares por mucho tiempo.",
        altImage: "assets/images/cow_2.png"),
    Animal(
        id: 4,
        name: "Perro",
        image: "assets/images/dog.jpg",
        sound: "assets/audios/dog.wav",
        description:
            "Los perros tienen un súper olfato, ¡pueden oler hasta 100.000 veces mejor que los humanos! Por eso, muchas veces ayudan a encontrar cosas o personas.",
        altImage: "assets/images/dog_2.png"),
    Animal(
        id: 5,
        name: "Caballo",
        image: "assets/images/horse.jpg",
        sound: "assets/audios/horse.wav",
        description:
            "Los caballos pueden dormir de pie gracias a sus patas fuertes, y tienen una excelente memoria. Pueden reconocer amigos humanos después de muchos años.",
        altImage: "assets/images/horse_2.png"),
    Animal(
        id: 6,
        name: "Leon",
        image: "assets/images/lion.jpg",
        sound: "assets/audios/lion.wav",
        description:
            "Los leones son conocidos como los \"reyes de la selva\" y su rugido puede escucharse hasta a 8 kilómetros. Las hembras son las que cazan para alimentar a toda la familia.",
        altImage: "assets/images/lion_2.png"),
    Animal(
        id: 7,
        name: "Gallo",
        image: "assets/images/rooster.jpg",
        sound: "assets/audios/rooster.wav",
        description:
            "Los gallos cantan para marcar su territorio y avisar a otros que están ahí. Su canto puede escucharse desde muy lejos, ¡incluso a 1 km de distancia!",
        altImage: "assets/images/rooster_2.png"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final double titleHeight = size.height * 0.20;

    return Scaffold(
        backgroundColor: const Color(0xFF285555),
        appBar: const MyAppBar(
          isDetailsPage: false,
        ),
        body: Stack(children: [
          Positioned(
              top: titleHeight * 1.5,
              left: 0,
              right: 100,
              child: Container(
                height: size.height,
                decoration: const BoxDecoration(
                  color: Color(0xFF1f4949),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                  ),
                ),
              )),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: titleHeight,
            child: titleWidget(size),
          ),
          Positioned(
            top: titleHeight,
            left: 16,
            right: 140,
            bottom: 0,
            child: ListView.builder(
              itemCount: animals.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimalCard(index: index, animal: animals[index]);
              },
            ),
          ),
          Positioned(
              top: titleHeight,
              right: 0,
              width: 70,
              bottom: 24,
              child: verticalMenu()),
        ]));
  }

  Widget titleWidget(Size size) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
        bottom: 16,
      ),
      child: SizedBox(
        width: size.width,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "Our Majestic world together",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget verticalMenu() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text("Reptiles",
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w500))),
        RotatedBox(
            quarterTurns: -1,
            child: Text("Pajaros",
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w500))),
        RotatedBox(
            quarterTurns: -1,
            child: Text("Animales",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ))),
        RotatedBox(
            quarterTurns: -1,
            child: Text("Pescados",
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w500))),
      ],
    );
  }
}

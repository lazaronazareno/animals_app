import 'package:animals_app/details/animal_details.dart';
import 'package:animals_app/home.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AnimalCard extends StatefulWidget {
  final int index;
  final Animal animal;
  const AnimalCard({super.key, required this.index, required this.animal});

  @override
  State<AnimalCard> createState() => _AnimalCardState();
}

class _AnimalCardState extends State<AnimalCard> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimalDetails(animal: widget.animal),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 160,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(widget.animal.image),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Transform.translate(
              offset: const Offset(20, -100),
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(8)),
                alignment: Alignment.center,
                child: Text(
                  widget.animal.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: IconButton(
                  onPressed: () {
                    _audioPlayer.setAsset(widget.animal.sound);
                    if (isPlaying) {
                      _audioPlayer.pause();
                    } else {
                      _audioPlayer.play();
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

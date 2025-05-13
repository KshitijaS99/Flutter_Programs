import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AlphabetsScreen extends StatefulWidget {
  const AlphabetsScreen({super.key});

  @override
  _AlphabetsScreenState createState() => _AlphabetsScreenState();
}

class _AlphabetsScreenState extends State<AlphabetsScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<Map<String, String>> alphabets = List.generate(
    26,
    (index) => {
      'upper': String.fromCharCode(65 + index), // A-Z
      'lower': String.fromCharCode(97 + index), // a-z
    },
  );

  Future<void> _playAlphabetSound(String letter) async {
    try {
      final source = AssetSource('audio/alphabets/$letter.wav');
      print('Attempting to play: ${source.path}');
      await _audioPlayer.play(source);
    } catch (e) {
      print('Error playing sound: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error playing sound: $e'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: alphabets.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _playAlphabetSound(alphabets[index]['upper']!),
          child: Card(
            color: index % 2 == 0 ? Colors.teal[100] : Colors.orange[100],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    alphabets[index]['upper']!,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    alphabets[index]['lower']!,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

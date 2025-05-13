import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({super.key});

  @override
  _NumbersScreenState createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<Map<String, String>> numbers = List.generate(
    10,
    (index) => {
      'number': (index + 1).toString(),
      'text': _numberToWord(index + 1),
    },
  );

  static String _numberToWord(int number) {
    const List<String> words = [
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten'
    ];
    return words[number - 1];
  }

  Future<void> _playNumberSound(int number) async {
    try {
      final source = AssetSource('audio/numbers/$number.wav');
      print('Attempting to play: ${source.path}');
      await _audioPlayer.play(source);
    } catch (e) {
      print('Error playing sound: $e');
      // Show a snackbar to inform the user about the error
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
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _playNumberSound(index + 1),
          child: Card(
            color: index % 2 == 0 ? Colors.teal[100] : Colors.orange[100],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  numbers[index]['number']!,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const SizedBox(height: 5),
                Text(
                  numbers[index]['text']!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

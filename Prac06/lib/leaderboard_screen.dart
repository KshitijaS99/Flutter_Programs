import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaderboardScreen extends StatefulWidget {
  LeaderboardScreen({super.key});

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<Map<String, dynamic>> leaderboardData = [
    {'name': 'Saumya', 'score': 0},
    {'name': 'Alex', 'score': 8},
    {'name': 'Bella', 'score': 6},
    {'name': 'Charlie', 'score': 9},
    {'name': 'Diya', 'score': 7},
    {'name': 'Ethan', 'score': 5},
    {'name': 'Fiona', 'score': 10},
    {'name': 'Gina', 'score': 4},
  ];

  @override
  void initState() {
    super.initState();
    _loadLeaderboard();
  }

  Future<void> _loadLeaderboard() async {
    final prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('userName') ?? 'Saumya';
    int score = prefs.getInt('latestScore_$name') ?? 0;

    setState(() {
      leaderboardData[0] = {'name': name, 'score': score};
      leaderboardData.sort((a, b) => b['score'].compareTo(a['score']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: leaderboardData.length,
      itemBuilder: (context, index) {
        return Card(
          color: index == 0 ? Colors.orange[100] : Colors.teal[100],
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text(
                leaderboardData[index]['name'][0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              leaderboardData[index]['name'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              "Score: ${leaderboardData[index]['score']}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 126, 177, 228),
          child: const Text(
            "Notifications",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildNotificationItem(
                context,
                "- Parents Teacher Meeting, November 2022",
                "https://mca.spit.ac.in/index.php/notifications/",
              ),
              _buildNotificationItem(
                context,
                "- Parents Teacher Meeting, April 2023",
                "https://mca.spit.ac.in/wp-content/uploads/2024/07/Report_PTM_20-4-23.pdf",
              ),
              _buildNotificationItem(
                context,
                "- Parents Teacher Meeting Notice, 2023",
                "https://mca.spit.ac.in/wp-content/uploads/2023/11/PTM23-24.pdf",
              ),
              _buildNotificationItem(
                context,
                "- Parents Teacher Meeting, November 2023",
                "https://mca.spit.ac.in/wp-content/uploads/2024/07/PTM_3-11-23.pdf",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationItem(BuildContext context, String text, String url) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(text, style: const TextStyle(fontSize: 16)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[700]),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WebViewPage(url: url)),
          );
        },
        hoverColor: Colors.blue[50],
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({required this.url, super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Details"),
        backgroundColor: Colors.blue[700],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../utils/tts_helper.dart';

class NewsDetailsPage extends StatelessWidget {
  final String title;
  final String url;
  final String description;
  final String imageUrl;
  final bool isBookmarked;
  final Function onBookmarkToggle;

  NewsDetailsPage({
    required this.title,
    required this.url,
    required this.description,
    required this.imageUrl,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    final tts = TTSHelper();

    return Scaffold(
      appBar: AppBar(
        title: Text("News Details"),
        actions: [
          IconButton(
            icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
            onPressed: () => onBookmarkToggle(),
          ),
          IconButton(
            icon: Icon(Icons.volume_up),
            onPressed: () => tts.speak(description),
          )
        ],
      ),
      body: Column(
        children: [
          Image.network(imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          )
        ],
      ),
    );
  }
}


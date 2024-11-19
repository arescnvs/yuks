import 'package:flutter/material.dart';
import '../models/question.dart';
import '../models/answer.dart';

class CommentScreen extends StatefulWidget {
  final Question question;

  const CommentScreen({super.key, required this.question});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _answerController = TextEditingController();

  void _submitAnswer() {
    String content = _answerController.text.trim();
    if (content.isNotEmpty) {
      Answer newAnswer = Answer(
        id: DateTime.now().millisecondsSinceEpoch,
        content: content,
        upvotes: 0,
        downvotes: 0,
        isUpvoted: false,
        isDownvoted: false,
      );
      Navigator.pop(context, newAnswer); // Kembalikan jawaban baru ke layar sebelumnya
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Answer cannot be empty!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Comment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              widget.question.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _answerController,
              decoration: const InputDecoration(labelText: 'Your Answer'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitAnswer,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

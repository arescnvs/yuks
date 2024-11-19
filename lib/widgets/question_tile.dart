import 'package:flutter/material.dart';
import '../models/question.dart';
import '../models/answer.dart';

class QuestionTile extends StatefulWidget {
  final Question question;
  final Function(Answer) onAnswerUpvote;
  final Function(Answer) onAnswerDownvote;
  final Function() onQuestionUpvote;
  final Function() onQuestionDownvote;
  final Function() onAddAnswer;

  const QuestionTile({super.key,
    required this.question,
    required this.onAnswerUpvote,
    required this.onAnswerDownvote,
    required this.onQuestionUpvote,
    required this.onQuestionDownvote,
    required this.onAddAnswer,
  });

  @override
  _QuestionTileState createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(widget.question.content),
            const SizedBox(height: 8),
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: widget.question.isUpvoted ? Colors.green : null,
                      ),
                      onPressed: widget.onQuestionUpvote,
                    ),
                    Text('${widget.question.upvotes}'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.thumb_down,
                        color: widget.question.isDownvoted ? Colors.red : null,
                      ),
                      onPressed: widget.onQuestionDownvote,
                    ),
                    Text('${widget.question.downvotes}'),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: widget.onAddAnswer,
              child: const Text('Add Answer'),
            ),
            const SizedBox(height: 16),
            Column(
              children: widget.question.answers.map((answer) {
                return ListTile(
                  title: Text(answer.content),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: answer.isUpvoted ? Colors.green : null,
                        ),
                        onPressed: () => widget.onAnswerUpvote(answer),
                      ),
                      Text(answer.upvotes.toString()),
                      IconButton(
                        icon: Icon(
                          Icons.thumb_down,
                          color: answer.isDownvoted ? Colors.red : null,
                        ),
                        onPressed: () => widget.onAnswerDownvote(answer),
                      ),
                      Text(answer.downvotes.toString()),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CourseComponent extends StatelessWidget {
  final Map<String, String> curso;
  final VoidCallback onTap;

  const CourseComponent({
    super.key,
    required this.curso,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                curso['imagem'] ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.school, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                curso['nome'] ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
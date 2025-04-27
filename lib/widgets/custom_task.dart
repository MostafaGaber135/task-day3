import 'package:flutter/material.dart';

class CustomTask extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final VoidCallback onToggleComplete;
  final VoidCallback onDelete;

  const CustomTask({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onToggleComplete,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggleComplete,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isCompleted ? Colors.white : const Color(0xFF232328),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor:
                      isCompleted ? Color(0XFF17E0BC) : Colors.transparent,
                  child: Icon(
                    isCompleted ? Icons.check : Icons.circle_outlined,
                    color: isCompleted ? Colors.white : Colors.grey,
                    size: 25,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          color: Color(0XFFffe13c),
                          size: 18,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: isCompleted ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

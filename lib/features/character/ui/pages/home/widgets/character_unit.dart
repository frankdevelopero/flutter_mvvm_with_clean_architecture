import 'package:flutter/material.dart';
import 'package:flutter_clean/features/character/ui/constants/text_styles.dart';

class CharacterUnit extends StatelessWidget {
  const CharacterUnit({
    Key? key,
    required this.id,
    required this.imageURI,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final int id;
  final String imageURI;
  final String title;
  final Function(int id) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(id);
      },
      child: Container(
        constraints: const BoxConstraints.tightFor(width: 120, height: 150),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageURI,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(title,
                  textAlign: TextAlign.center, style: secondaryTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}

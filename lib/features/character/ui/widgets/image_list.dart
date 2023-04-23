import 'package:flutter/material.dart';
import 'package:flutter_clean/features/character/ui/constants/text_styles.dart';
import 'package:flutter_clean/features/character/ui/widgets/image_item.dart';

class ImageList extends StatelessWidget {
  const ImageList({
    Key? key,
    required this.width,
    required this.height,
    required this.isLoading,
    required this.imageItems,
  }) : super(key: key);

  final double width;
  final double height;
  final bool isLoading;
  final List<ImageItem> imageItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: (isLoading)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageItems.length,
              itemBuilder: (context, index) {
                return Container(
                    constraints: BoxConstraints.tightFor(width: width),
                    margin: const EdgeInsets.only(right: 4),
                    child: Column(
                      children: [
                        Image.network(
                          imageItems[index].imageURI,
                          fit: BoxFit.cover,
                          height: 200,
                          width: 150,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 8.00, bottom: 8.00),
                          child: Text(
                            imageItems[index].title,
                            style: subtitleTextStyle,
                          ),
                        )
                      ],
                    ));
              },
            ),
    );
  }
}

import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker(
      {super.key, required this.colors, required this.onSelectedColor});

  final List<Color> colors;
  final Function(Color) onSelectedColor;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    late Color _selectedColor = widget.colors.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 8,
          children: widget.colors.map((item) {
            return GestureDetector(
              onTap: () {
                _selectedColor = item;
                widget.onSelectedColor(item);
                setState(() {});
              },
              child: CircleAvatar(
                backgroundColor: item,
                radius: 17,
                child: _selectedColor == item
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

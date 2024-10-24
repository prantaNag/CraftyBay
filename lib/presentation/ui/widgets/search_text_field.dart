
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key, required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {


    return 
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: "Search",
              prefixIcon: const Icon(Icons.search),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              )),
      
    );
  }
}

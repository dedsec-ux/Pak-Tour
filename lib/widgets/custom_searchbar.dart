import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  const CustomSearchBar({
    super.key,
    this.hintText = "Search",
    this.onChanged,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: hintText,
      onChanged: onChanged,
      leading: const Icon(Icons.search),
      trailing: [
        IconButton(
          onPressed: onFilterTap,
          icon: const Icon(Icons.tune),
          style: IconButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ),
      ],
      elevation: MaterialStateProperty.all(2),
      backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.8)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}

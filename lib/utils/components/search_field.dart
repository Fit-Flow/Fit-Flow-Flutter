import 'package:flutter/material.dart';

import '../app_colors.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.lightGreyColor),
      ),
      child: TextField(
        onChanged: (value) {
          // Handle søgefunktionalitet her
        },
        style: TextStyle(color: AppColors.textColor),
        cursorColor: AppColors.yellowColor,
        controller: _searchController,
        focusNode: _searchFocus,
        decoration: InputDecoration(
          hintText: 'Søg...',
          hintStyle: TextStyle(color: AppColors.lightGreyColor),
          prefixIcon: Icon(Icons.search, color: AppColors.lightGreyColor),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              color: AppColors.lightGreyColor,
            ),
            onPressed: () {
              _searchController.clear();
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

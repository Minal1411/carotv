import 'package:carotv/core/resources/app_colors.dart';
import 'package:carotv/core/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({
    super.key,
  });

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.primary,
      icon: const Icon(Icons.search),
      onPressed: () {
        context.goNamed(AppRoutes.searchScreen);
      },
      label: const Text('Search'),
    );
  }
}

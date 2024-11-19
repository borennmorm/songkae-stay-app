import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const SearchButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Iconsax.search_normal4,
                color: Color(0xFF002352),
                size: 24,
              ),
              SizedBox(width: 8),
              Text(
                'Search',
                style: TextStyle(
                  color: Color(0xFF002352),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

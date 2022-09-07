import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_api/providers/dio_provider.dart';
import 'package:food_api/views/theme/theme.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const SearchBox({
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: ksecondaryColor.withOpacity(0.32),
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          icon: SvgPicture.asset("assets/icons/search.svg",),
          hintText: Provider.of<DioProvider>(context).searchController.text.isEmpty ? "Search Here" : Provider.of<DioProvider>(context).searchController.text ,
          hintStyle: TextStyle(color: Provider.of<DioProvider>(context).searchController.text.isEmpty ? ksecondaryColor : Colors.black),
        ),
      ),
    );
  }
}
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar(
      {super.key, required this.searchTextController, this.onChanged});

  final TextEditingController searchTextController;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: '${S.of(context).FindCustomer}...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18),
      onChanged: onChanged,
    );
  }
}

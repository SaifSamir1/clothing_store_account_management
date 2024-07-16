import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';

class AllMoney extends StatelessWidget {
  const AllMoney({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(S.of(context).totalAccount),
      leading: const Icon(Icons.money),
      onTap: () {},
    );
  }
}

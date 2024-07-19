
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../generated/assets.dart';

class ShopHeader extends StatelessWidget {
  const ShopHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultColor,
      child:  CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 60,)),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(Assets.imagesLogo),
                  radius: 60,
                ),
                const SizedBox(height: 15,),
                Text('Samir Clothing',style: AppStyles.styleSemiBold24(context).copyWith(color: Colors.white)),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Expanded(
                    child: SizedBox(
                      height: 20,
                    )),
                Flexible(
                  child: SizedBox(
                    width: 300,
                    child: Text(' - There are all kinds of women\'s clothing and furnishings',style:
                    AppStyles.styleSemiBold24(context).copyWith(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

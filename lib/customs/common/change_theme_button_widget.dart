import 'package:ez_at_u/customs/common/provider/theme_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SizedBox(
      width: 40,
      height: 40,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch.adaptive(
          value: themeProvider.isDarkMode,
          onChanged: (value) {
            final provider = Provider.of<ThemeProvider>(context, listen: false);
            provider.toggleTheme(value);
          },

          activeColor:Theme.of(context).bottomAppBarColor ,
          activeTrackColor:Colors.green,
        ),
      ),
    );
  }
}

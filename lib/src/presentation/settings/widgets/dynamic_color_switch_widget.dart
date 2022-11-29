import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';

import '../../../data/settings/settings_service.dart';
import '../../../service_locator.dart';
import 'setting_option.dart';

class DynamicColorSwitchWidget extends StatefulWidget {
  const DynamicColorSwitchWidget({Key? key}) : super(key: key);

  @override
  DynamicColorSwitchWidgetState createState() =>
      DynamicColorSwitchWidgetState();
}

class DynamicColorSwitchWidgetState extends State<DynamicColorSwitchWidget> {
  final Box<dynamic> settings = locator.get();
  late bool isDynamic = settings.get(
    dynamicColorKey,
    defaultValue: false,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsOption(
      title: AppLocalizations.of(context)!.dynamicColorLabel,
      trailing: Switch(
        value: isDynamic,
        onChanged: (value) {
          setState(() {
            isDynamic = value;
          });
          settings.put(dynamicColorKey, value);
        },
      ),
    );
  }
}

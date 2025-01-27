import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../core/enum/box_types.dart';
import '../../service_locator.dart';
import '../home/widgets/welcome_widget.dart';
import '../settings/widgets/user_profile_widget.dart';
import 'color_palette.dart';

class PaisaUserWidget extends StatelessWidget {
  const PaisaUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ColorPalette(),
          ),
        );
      },
      onTap: () => showModalBottomSheet(
        constraints: BoxConstraints(
          maxWidth:
              MediaQuery.of(context).size.width >= 700 ? 700 : double.infinity,
        ),
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        context: context,
        builder: (_) => UserProfilePage(
          settings: locator.get<Box<dynamic>>(
            instanceName: BoxType.settings.name,
          ),
          nameController: TextEditingController(),
        ),
      ),
      child: const WelcomeWidget(),
    );
  }
}



import 'package:eiga_v2/widgets/logo/logo.dart';
import 'package:flutter/cupertino.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMain({
    super.key,
    // required this.profi
    // required this.t,
    // this.needsSync = false,
    // this.onSync,
    this.onSettings,
    // this.on
});

  // final LanguageProfileService profileService;
  // final String Function(String key) t;
  // final bool needsSync;
  // final Future<void> Function()? onSync;
  final VoidCallback? onSettings;
  // final ValueChanged<LanguageProfile>

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 64,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Logo(size: 28),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
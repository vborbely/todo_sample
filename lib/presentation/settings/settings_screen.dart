import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_sample/application/application.dart';

import '../../data/data.dart';
import '../presentation.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarColorize(),
        title: const Text('Settings Screen', style: appBarTextStyle),
      ),
      body: const _ScreenBody(),
    );
  }
}

class _ScreenBody extends StatelessWidget {
  const _ScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsCubitState>(
        builder: (context, state) {
      final settings = context.select((SettingsCubit cubit) => cubit.state);
      return settings.maybeWhen(
          loaded: (settings) => _SettingsList(key: key, settings: settings),
          orElse: () => const NoSettingsWarning());
    });
  }
}

class NoSettingsWarning extends StatelessWidget {
  const NoSettingsWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Could not load settings"),
    );
  }
}

class _SettingsList extends StatelessWidget {
  final Map<SettingsKey, Settings> settings;

  const _SettingsList({Key? key, required this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...settings.values
            .map((setting) => _SettingsItem(
          settings: setting,
                  isSelected: setting.value,
                  onChanged: () =>
                      context.read<SettingsCubit>().toggleSetting(setting),
                ))
            .toList(),
      ],
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final Settings settings;
  final bool isSelected;
  final Function onChanged;

  const _SettingsItem({
    Key? key,
    required this.settings,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                settings.label,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Visibility(
                  visible: settings.description != null,
                  child: Text(settings.description ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.descriptionTextColor,
                      ))),
            ],
          ),
          const Spacer(),
          Switch(
            value: isSelected,
            onChanged: (newValue) {
              onChanged.call();
            },
          ),
        ],
      ),
    );
  }
}

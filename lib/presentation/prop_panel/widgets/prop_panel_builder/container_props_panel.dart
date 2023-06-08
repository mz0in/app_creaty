
import 'package:app_creaty/commons/extensions/theme_extension.dart';
import 'package:app_creaty/l10n/l10n.dart';
import 'package:app_creaty/presentation/prop_panel/widgets/field_builder/prop_color_picker.dart';
import 'package:app_creaty/presentation/prop_panel/widgets/widgets.dart';
import 'package:app_creaty/presentation/virtual_app/virtual_app.dart';
import 'package:app_creaty/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:json_widget/json_widget.dart' as json_widget;

class ContainerPropsPanel extends StatefulWidget {
  const ContainerPropsPanel({super.key, required this.jsonWidget});

  final json_widget.Container jsonWidget;

  @override
  State<ContainerPropsPanel> createState() => _ContainerPropsPanelState();
}

class _ContainerPropsPanelState extends State<ContainerPropsPanel> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Container',
          style: context.textTheme.displaySmall,
        ),
        const Gap(16),
        _buildPropsForm(),
      ],
    );
  }

  Widget _buildPropsForm() {
    return ColumnWithSpacing(
      spacing: 24,
      children: [
        FieldPropTile(
          titleText: context.l10n.backgroundColorLabel,
          child: PropColorPicker(
            currentColor: json_widget.$color(
                  context,
                  widget.jsonWidget.decoration?.color,
                ) ??
                Colors.white,
            onColorConfirmed: (color) {
              final updatedBoxDecoration = widget.jsonWidget.decoration
                  ?.copyWith(color: json_widget.Color(color.value));
              final updatedContainer =
                  widget.jsonWidget.copyWith(decoration: updatedBoxDecoration);
              context
                ..pop()
                ..read<VirtualAppBloc>()
                    .add(ChangeProp(widget: updatedContainer));
            },
          ),
        ),
      ],
    );
  }
}

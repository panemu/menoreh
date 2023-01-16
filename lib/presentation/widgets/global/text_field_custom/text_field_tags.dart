import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldTagCustom extends StatelessWidget {
  final TextfieldTagsController controller;
  final String title;
  final String tooltip;
  final String hint;
  final List<String>? initialTags;
  final Validator? validator;

  const TextFieldTagCustom({
    Key? key,
    required this.controller,
    required this.title,
    required this.hint,
    this.initialTags,
    this.validator,
    this.tooltip = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) _TitleBuilder(title: title, tooltip: tooltip),
        if (title.isNotEmpty) SizedBox(height: AppDimens.size3S),
        TextFieldTags(
          textfieldTagsController: controller,
          initialTags: initialTags,
          textSeparators: const [','],
          validator: validator,
          letterCase: LetterCase.normal,
          inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
            return ((context, sc, tags, onTagDelete) {
              return TextFormField(
                controller: tec,
                focusNode: fn,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey.shade100, width: 1),
                    borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
                    borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                  ),
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: controller.hasTags ? 'Masukan tag' : hint,
                  errorText: error,
                  contentPadding: const EdgeInsets.all(AppDimens.paddingMedium),
                  prefixIconConstraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 1),
                  prefixIcon: tags.isNotEmpty
                      ? _ChipBuilder(
                          onTagDelete: onTagDelete,
                          sc: sc,
                          tags: tags,
                        )
                      : null,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: onChanged,
                onFieldSubmitted: onSubmitted,
              );
            });
          },
        ),
      ],
    );
  }
}

class _TitleBuilder extends StatelessWidget {
  const _TitleBuilder({Key? key, required this.title, required this.tooltip}) : super(key: key);

  final String title;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    if (tooltip.isEmpty) return Text(title, textAlign: TextAlign.left);

    return Row(
      children: [
        Text(title, textAlign: TextAlign.left),
        SizedBox(width: AppDimens.size2S),
        Tooltip(
          message: tooltip,
          preferBelow: true,
          verticalOffset: AppDimens.size2M,
          child: Icon(
            Icons.help_outline_rounded,
            color: AppColors.secondary,
            size: AppDimens.size3M,
          ),
        )
      ],
    );
  }
}

class _ChipBuilder extends StatelessWidget {
  final void Function(String) onTagDelete;
  final ScrollController sc;
  final List<String> tags;

  const _ChipBuilder({
    Key? key,
    required this.onTagDelete,
    required this.sc,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: sc,
      scrollDirection: Axis.horizontal,
      child: Row(
          children: tags.map((String tag) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.radiusLargeX)),
            color: AppColors.secondary,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(tag, style: const TextStyle(color: AppColors.white)),
              SizedBox(width: AppDimens.size2S),
              InkWell(
                child: Icon(
                  Icons.cancel,
                  size: AppDimens.size2M,
                  color: AppColors.grey.shade100,
                ),
                onTap: () {
                  onTagDelete(tag);
                },
              )
            ],
          ),
        );
      }).toList()),
    );
  }
}

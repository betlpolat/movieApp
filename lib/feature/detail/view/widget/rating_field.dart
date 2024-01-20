import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/widget/decoration/custom_field.dart';
import '../../../../product/widget/text/custom_field_text.dart';

class RatingField extends StatelessWidget {
  const RatingField({
    super.key,
    required this.voteAverage,
  });

  final num voteAverage;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      child: Row(
        children: [
          CustomFieldText(
            text: '${LocaleKeys.text_release.locale}: ',
          ),
          Icon(Icons.star, color: context.colors.tertiary),
          Text(
            '${voteAverage.toStringAsFixed(1)}/10',
            style: context.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

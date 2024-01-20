import 'package:flutter/material.dart';

import '../../../../core/extension/string_extension.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/widget/decoration/custom_field.dart';
import '../../../../product/widget/text/custom_field_text.dart';

class ReleaseField extends StatelessWidget {
  const ReleaseField({
    super.key,
    required this.releaseDate,
  });

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return CustomField(
      child: Row(
        children: [
          CustomFieldText(
            text: '${LocaleKeys.text_release.locale}: $releaseDate',
          ),
        ],
      ),
    );
  }
}

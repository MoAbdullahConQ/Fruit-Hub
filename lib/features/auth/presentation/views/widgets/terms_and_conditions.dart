import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_style.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 8),
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        SizedBox(width: 16),

        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E) /* Grayscale-600 */,
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor /* Green1-600 */,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E) /* Grayscale-600 */,
                  ),
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor /* Green1-600 */,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E) /* Grayscale-600 */,
                  ),
                ),
                TextSpan(
                  text: 'بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor /* Green1-600 */,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

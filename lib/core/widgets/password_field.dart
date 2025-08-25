import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      suffixIcon: IconButton(
        onPressed: () {
          obscureText = !obscureText;
          setState(() {});
        },
        icon:
            obscureText
                ? Icon(Icons.remove_red_eye, color: Color(0xFFC9CECF))
                : Icon(Icons.visibility_off, color: Color(0xFFC9CECF)),
      ),
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
    );
  }
}

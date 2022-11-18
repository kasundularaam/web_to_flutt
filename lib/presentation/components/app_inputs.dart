import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;
  final String? hint;
  const AppInput({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.isPassword,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.w),
          ),
          hintText: hint,
          labelText: hint,
        ),
      );
}

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  const InputText({
    Key? key,
    required this.controller,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppInput(
        controller: controller,
        isPassword: false,
        textInputType: TextInputType.text,
        hint: hint,
      );
}

class InputEmail extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  const InputEmail({
    Key? key,
    required this.controller,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppInput(
        controller: controller,
        isPassword: false,
        textInputType: TextInputType.emailAddress,
        hint: hint,
      );
}

class InputName extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  const InputName({
    Key? key,
    required this.controller,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppInput(
        controller: controller,
        isPassword: false,
        textInputType: TextInputType.name,
        hint: hint,
      );
}

class InputPassword extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  const InputPassword({
    Key? key,
    required this.controller,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppInput(
        controller: controller,
        isPassword: true,
        textInputType: TextInputType.visiblePassword,
        hint: hint,
      );
}

class InputNumber extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  const InputNumber({
    Key? key,
    required this.controller,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppInput(
        controller: controller,
        isPassword: false,
        textInputType: TextInputType.number,
        hint: hint,
      );
}

class InputPhone extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  const InputPhone({
    Key? key,
    required this.controller,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppInput(
        controller: controller,
        isPassword: false,
        textInputType: TextInputType.phone,
        hint: hint,
      );
}

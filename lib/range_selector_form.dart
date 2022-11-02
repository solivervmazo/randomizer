import 'package:flutter/material.dart';
import 'package:flutter_foundations/main.dart';
import 'package:flutter_foundations/randomizer_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends ConsumerWidget {
  const RangeSelectorForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              labelText: 'Minimum',
              intValueSetter: (value) =>
                  ref.read(randomizerProvider.notifier).setMin(value),
            ),
            const SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormField(
              labelText: 'Maximum',
              intValueSetter: (value) =>
                  ref.read(randomizerProvider.notifier).setMax(value),
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '0')),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an integer';
        }
        return null;
      },
    );
  }
}

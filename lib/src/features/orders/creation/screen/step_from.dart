import 'package:flutter/material.dart';
import 'package:order_tracker/src/utils/constants.dart';
import 'package:order_tracker/src/utils/validator.dart';
import 'package:order_tracker/src/widgets/form_input_field.dart';
import 'package:order_tracker/src/widgets/listview_with_bottom_button.dart';

class OrdersStepForm extends StatefulWidget {
  const OrdersStepForm({super.key, required this.title});

  final String title;

  @override
  State<OrdersStepForm> createState() => _OrdersStepFormState();
}

class _OrdersStepFormState extends State<OrdersStepForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> formElements = List<Widget>.generate(
        10,
        ((index) => FormInputField(
            labelText: "Step ${index + 1}",
            keyboardType: TextInputType.text,
            validator: ((value) => validate(value, [VALIDATORS.empty])))));

    Widget bottomButton = ElevatedButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
      child: const Text('Create Order'),
    );
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: _formKey,
                child: ListWithBottomButton(
                    listViewItems: formElements, bottomButton: bottomButton)),
          ),
        ));
  }
}

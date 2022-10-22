import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:order_tracker/src/utils/constants.dart';
import 'package:order_tracker/src/utils/validator.dart';
import 'package:order_tracker/src/widgets/form_input_field.dart';
import 'package:order_tracker/src/widgets/listview_with_bottom_button.dart';

class OrdersDetailForm extends StatefulWidget {
  const OrdersDetailForm({super.key, required this.title});

  final String title;

  @override
  State<OrdersDetailForm> createState() => _OrdersDetailFormState();
}

class _OrdersDetailFormState extends State<OrdersDetailForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> listItems = [
      FormInputField(
          labelText: "Order Name",
          keyboardType: TextInputType.text,
          validator: ((value) => validate(value, [VALIDATORS.empty]))),
      FormInputField(
          labelText: "Number of Bundles",
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          validator: ((value) =>
              validate(value, [VALIDATORS.empty, VALIDATORS.bundles]))),
      FormInputField(
          labelText: "Number of Steps",
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          validator: ((value) =>
              validate(value, [VALIDATORS.empty, VALIDATORS.steps]))),
    ];
    Widget bottomButton = ElevatedButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_formKey.currentState!.validate()) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Processing Data')),
          // );
          Navigator.pushNamed(context, "/order/step/form");
        }
      },
      child: const Text('Next'),
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
                    listViewItems: listItems, bottomButton: bottomButton)),
          )),
    );
  }
}

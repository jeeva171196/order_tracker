import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:order_tracker/src/models/dummy.dart';
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
  DummyDetail model = DummyDetail();

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    List<Widget> listItems = [
      FormInputField(
          labelText: "Order Name",
          keyboardType: TextInputType.text,
          onSaved: (String? value) {
            model.name = value;
          },
          validator: ((value) => validate(value, [VALIDATORS.empty]))),
      FormInputField(
          labelText: "Number of Bundles",
          keyboardType: TextInputType.number,
          onSaved: (String? value) {
            model.numOfBundles = int.parse(value!);
          },
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          validator: ((value) =>
              validate(value, [VALIDATORS.empty, VALIDATORS.bundles]))),
      FormInputField(
          labelText: "Number of Steps",
          keyboardType: TextInputType.number,
          onSaved: (String? value) {
            model.numOfSteps = int.parse(value!);
          },
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
          _formKey.currentState!.save();
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Processing Data')),
          // );
          Navigator.pushNamed(context, "/order/step/form", arguments: {
            "orderDetail": model,
            "orderService": arguments["orderService"]
          });
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

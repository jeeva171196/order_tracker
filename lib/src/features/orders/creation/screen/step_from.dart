import 'package:flutter/material.dart';
import 'package:order_tracker/src/features/orders/dashboard/screen/list.dart';
import 'package:order_tracker/src/features/orders/services/orders.dart';
import 'package:order_tracker/src/models/dummy.dart';
import 'package:order_tracker/src/models/hive/orders/orders.dart';
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
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    DummyDetail orderDetail = arguments["orderDetail"];
    Future<OrderService> orderService = arguments["orderService"];
    List<Widget> formElements = List<Widget>.generate(
        orderDetail.numOfSteps!,
        ((index) => FormInputField(
            labelText: "Step ${index + 1}",
            keyboardType: TextInputType.text,
            onSaved: (String? value) {
              if (orderDetail.steps != null) {
                orderDetail.steps![index + 1] = value!;
              }
              orderDetail.steps = {index + 1: value!};
            },
            validator: ((value) => validate(value, [VALIDATORS.empty])))));

    Widget bottomButton = ElevatedButton(
      onPressed: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          Order order = Order.fromDummyDetail(orderDetail);
          await (await orderService).addOrder(order);
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const OrdersList(title: titleOrderList)),
              (Route<dynamic> route) => false);
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

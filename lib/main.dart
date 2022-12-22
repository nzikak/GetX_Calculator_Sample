import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_calc_example/init_controllers.dart';
import 'controllers/calc_controller.dart';

typedef OnTap = void Function();

void main() {
  runApp(
    GetMaterialApp(
      title: "GetX Example",
      initialBinding: InitControllers(),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Retrieves the controller
    final controller = Get.find<CalculationController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX Example"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Card(
                child: SizedBox(
                  width: double.maxFinite,
                  height: 100,
                  child: _calcWidget(),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _tapButton(
                            "+ NumOne",
                            Colors.grey.shade700,
                            () {
                              controller.increaseNumOne();
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _tapButton(
                            "+ NumTwo",
                            Colors.blueGrey,
                            () {
                              controller.increaseNumTwo();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _tapButton(
                            "- NumOne",
                            Colors.grey,
                            () {
                              controller.decreaseNumOne();
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _tapButton(
                            "- NumTwo",
                            Colors.blueGrey.shade300,
                            () {
                              controller.decreaseNumTwo();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    _tapButton(
                      "Add",
                      Colors.green,
                      () {
                        controller.add();
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _tapButton(
                      "Subtract",
                      Colors.blueAccent,
                      () {
                        controller.subtract();
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _tapButton(
                      "Multiply",
                      Colors.amber,
                      () {
                        controller.multiply();
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _tapButton(
                      "Divide",
                      Colors.red,
                      () {
                        controller.divide();
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _tapButton(
                      "Reset",
                      Colors.teal,
                      () {
                        controller.reset();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _tapButton(String title, Color color, OnTap onTap) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  Widget _calcWidget() {
    return GetBuilder<CalculationController>(
      builder: (calcController) {
        return Center(
          child: Text(
            "${calcController.numOne} ${calcController.currentSign} ${calcController.numTwo} = ${calcController.result}",
            style: const TextStyle(
                fontSize: 30, color: Colors.black),
          ),
        );
      },
    );
  }
}

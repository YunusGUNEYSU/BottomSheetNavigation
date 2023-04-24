import 'package:flutter/material.dart';
import 'package:nestedbottomsheet/controller/controller.dart';
import 'package:nestedbottomsheet/pages/control_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SheetController sheetController = SheetController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MaterialButton(
        color: Colors.red,
        onPressed: () async => await showModalBottomSheet(
          isScrollControlled: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          enableDrag: true,
          isDismissible: true,
          context: context,
          builder: (context) {
            return ConstrainedBox(
                constraints:
                    const BoxConstraints(minHeight: 100, maxHeight: 350),
                child: ControlBottomSheet(
                  sheetController: sheetController,
                ));
          },
        ),
        child: const Text("Show sheet"),
      ),
    ));
  }
}

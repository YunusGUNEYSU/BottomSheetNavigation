// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nestedbottomsheet/controller/controller.dart';

import 'package:nestedbottomsheet/enum/page_enum.dart';
import 'package:nestedbottomsheet/widget/exit_button.dart';

class ControlBottomSheet extends StatefulWidget {
  final SheetController sheetController;
  const ControlBottomSheet({
    Key? key,
    required this.sheetController,
  }) : super(key: key);

  @override
  State<ControlBottomSheet> createState() => _ControlBottomSheetState();
}

class _ControlBottomSheetState extends State<ControlBottomSheet> {
  Color color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (widget.sheetController.getPageEnum == PageEnum.page1) ...[
          page1()
        ] else if (widget.sheetController.getPageEnum == PageEnum.page2) ...[
          page2()
        ]
      ],
    );
  }

  Column page1() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text("PAGE1"),
              const SizedBox(
                height: 80,
              ),
              MaterialButton(
                  color: Colors.grey[500],
                  child: const Text("Navigate page2"),
                  onPressed: () {
                    setState(() {
                      widget.sheetController.pageEnum = PageEnum.page2;
                    });
                  })
            ],
          ),
        ),
      ],
    );
  }

  Scaffold page2() {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              color: Colors.grey,
              onPressed: () => setState(() {
                    widget.sheetController.pageEnum = PageEnum.page1;
                  }),
              icon: const Icon(Icons.arrow_back_ios))),
      body: Center(
        child: Column(
          children: [
            const Text("PAGE2"),
            const SizedBox(
              height: 80,
            ),
            ExitButton(
              onPressed: () {
                setState(() {
                  widget.sheetController.pageEnum = PageEnum.page1;
                });
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

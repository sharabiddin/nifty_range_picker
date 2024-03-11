import 'package:flutter/material.dart';
import 'package:nifty_range_picker/nifty_range_picker.dart';

class NiftyRangePickerExamplePage extends StatefulWidget {
  const NiftyRangePickerExamplePage({super.key});

  @override
  State<NiftyRangePickerExamplePage> createState() => _NiftyRangePickerExamplePageState();
}

class _NiftyRangePickerExamplePageState extends State<NiftyRangePickerExamplePage> {
  final NiftyRangePickerController controller = NiftyRangePickerController(
    firstDate: DateTime(2022, 3, 1),
    lastDate: DateTime.now(),
    currentDate: DateTime.now(),
  );

  @override
  void initState() {
    controller.addListener(() => print(controller.selectedRange));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Nifty Range Picker Example'),
          actions: [
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () async {
                print(controller.selectedRange);
              },
            ),
          ],
        ),
        body: Center(
          child: Container(
            color: Colors.grey[200],
            child: NiftyRangeDatePicker(
              controller: controller,
              isVerticalAligned: false,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              currentDateDecorationColor: Colors.teal,
              dividerColor: Colors.red,
              currentDateDecoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              leadingDateTextStyle: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              daysOfTheWeekTextStyle: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              enabledCellsTextStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              disabledCellsTextStyle: const TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
              selectedCellsTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              singleSelectedCellTextStyle: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              currentDateTextStyle: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),

              selectedCellsDecorationColor: Colors.teal,
              singleSelectedCellDecorationColor: Colors.teal,
            ),
          ),
        ),
      );
}

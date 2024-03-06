## Range Picker

The range picker is a simple component that allows you to select a range of dates. It is a simple
component that is easy to use and can be customized to fit your needs.


## Getting Started

To use this plugin, add `nifty_range_picker` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).


## Usage

```dart

NiftyRangeDatePicker(
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
            )

```

`isVerticalAligned` flag is used for differentiate wide and small view ports, use `true` for small view ports and `false` for wide view ports.
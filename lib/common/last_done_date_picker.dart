import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastDoneDatePicker extends StatefulWidget {
  final Function(DateTime) onSave;
  final DateTime? initialDateTime;
  final Color? borderColor;

  const LastDoneDatePicker({
    super.key,
    required this.onSave,
    this.initialDateTime,
    this.borderColor,
  });

  @override
  State<LastDoneDatePicker> createState() => _LastDoneDatePickerState();
}

class _LastDoneDatePickerState extends State<LastDoneDatePicker> {
  late DateTime selectedDateTime;

  @override
  void initState() {
    super.initState();
    selectedDateTime = widget.initialDateTime ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(context),
          child: const SizedBox(height: 120),
        ),
        Flexible(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: widget.borderColor ??
                    const Color.fromARGB(255, 191, 97, 110),
                width: 3,
              ),
            ),
            margin: const EdgeInsets.all(16),
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              use24hFormat: false,
              showDayOfWeek: true,
              onDateTimeChanged: (DateTime newDate) {
                selectedDateTime = newDate;
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(context),
          child: const SizedBox(height: 40),
        ),
        TextButton(
          onPressed: () {
            widget.onSave(selectedDateTime);
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).brightness == Brightness.light
                    ? Theme.of(context).cardColor
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

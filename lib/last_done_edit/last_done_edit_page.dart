import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/common/last_done_date_picker.dart';
import 'package:last_done/last_done_card/entity/last_done_item.dart';

class LastDoneEditPage extends ConsumerWidget {
  final LastDoneItem item;
  final TextEditingController controller = TextEditingController();

  LastDoneEditPage({
    super.key,
    required this.item,
  }) {
    controller.text = item.title;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          foregroundColor: Theme.of(context).textTheme.bodyMedium?.color,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: const EdgeInsets.all(12),
              color: item.indicatorColor,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: TitleTextField(
                    controller: controller,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: Text(
                    '10 May 2023 12:46 AM',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return LastDoneDatePicker(
                          onSave: (newDate) {},
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Add Record',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
          ),
        ),
      ),
      controller: controller,
      cursorColor: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }
}

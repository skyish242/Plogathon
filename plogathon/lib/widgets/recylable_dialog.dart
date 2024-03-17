import 'package:flutter/material.dart';

class RecylableDialog extends StatelessWidget {
  final String instruction;
  final bool nearBinShown;
  const RecylableDialog(
      {super.key, required this.instruction, required this.nearBinShown});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Text("Good job! Item is recylable!",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600)),
      contentPadding:
          const EdgeInsets.only(top: 30.0, bottom: 24.0, left: 24, right: 24),
      backgroundColor: Colors.white,
      content: Text(
        instruction,
        style: Theme.of(context).textTheme.labelLarge,
        textAlign: TextAlign.start,
      ),
      actions: [
        !nearBinShown
            ? SizedBox(
                width: 118,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("Nearest Bin",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge),
                ),
              )
            : const SizedBox.shrink(),
        SizedBox(
          width: 118,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              elevation: 5,
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(
              "Resume",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

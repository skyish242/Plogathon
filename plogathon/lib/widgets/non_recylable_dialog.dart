import 'package:flutter/material.dart';

class NonRecylableDialog extends StatelessWidget {
  const NonRecylableDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      contentPadding:
          const EdgeInsets.only(top: 30.0, bottom: 24.0, left: 20, right: 20),
      backgroundColor: Colors.white,
      content: Text(
        "Item not recylable! Throw the item to your nearest waste bin 😊",
        style: Theme.of(context).textTheme.labelLarge,
        textAlign: TextAlign.center,
      ),
      actions: [
        SizedBox(
          width: 118,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 5,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child:
                Text("Resume", style: Theme.of(context).textTheme.labelLarge),
          ),
        ),
      ],
    );
  }
}

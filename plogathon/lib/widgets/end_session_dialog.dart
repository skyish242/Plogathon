import 'package:flutter/material.dart';

class EndSessionDialog extends StatelessWidget {
  const EndSessionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      contentPadding: const EdgeInsets.only(top: 30.0, bottom: 24.0),
      backgroundColor: Colors.white,
      content: Text(
        "End the Session?",
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
              Navigator.pop(context, false);
            },
            child:
                Text("Resume", style: Theme.of(context).textTheme.labelLarge),
          ),
        ),
        SizedBox(
          width: 118,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              elevation: 5,
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text("End",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class InProgressMessage extends StatelessWidget {
  final String screenName;
  final String progressName;

  const InProgressMessage({
    Key? key,
    required this.screenName,
    required this.progressName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          '$progressName is in progress...\n\nStill in $screenName\n\n',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    );
  }
}

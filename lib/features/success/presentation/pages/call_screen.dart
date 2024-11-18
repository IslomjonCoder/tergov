import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.scaleDown,
                  height: 100,
                  width: 100,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.filled(
                    style: IconButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {},
                    icon: Icon(Icons.volume_up),
                  ),
                  Gap(16),        IconButton.filled(
                    style: IconButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {},
                    icon: Icon(Icons.mic),
                  ),
                  Gap(16),
                  IconButton.filled(
                    style: IconButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.call_end),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

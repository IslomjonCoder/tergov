import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:tergov/utils/constants/colors.dart';

class DottedUploadBox extends StatelessWidget {
  const DottedUploadBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(15),
      dashPattern: const [6, 3],
      color: Colors.grey,
      strokeWidth: 1.5,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_upload_outlined,
              size: 50,
              color: Colors.grey,
            ),
            const Gap(20),
            OutlinedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                side: const BorderSide(color: TColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Загрузить подпись',
                style: TextStyle(color: TColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

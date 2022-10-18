import 'package:attendance_manager/provider/pick_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PickImage extends StatelessWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick The Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'pick an image',
              style: TextStyle(
                color: Color(0xFF616161),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Provider.of<PickImageProvider>(context, listen: false)
                        .changeImage('assets/images/img$index.png');
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/img$index.png',
                    fit: BoxFit.cover,
                  ),
                ),
                itemCount: 9,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.cloud_upload, color: Color(0xFF3CCF4E)),
              label: const Text(
                'Upload from device',
                style: TextStyle(
                  color: Color(0xFF003865),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
                // textStyle:
                side: const BorderSide(
                  color: Color(0xFFD4F6CC),
                  width: 1.6,
                ),
                backgroundColor: const Color(0xFFD4F6CC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

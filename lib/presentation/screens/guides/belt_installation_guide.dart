import 'package:flutter/material.dart';
import 'package:domestic_e_catalogue/core/constants/app_colors.dart';

class BeltInstallationGuideScreen extends StatelessWidget {
  const BeltInstallationGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belt Installation Guide'),
        backgroundColor: AppColors.primaryTeal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How to install Timing belt',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryTeal),
            ),
            const SizedBox(height: 10),
            _buildStep(1, 'Turn off the engine.'),
            _buildStep(2, 'Make sure that engine has cooled down and wear some sensor-resistance gloves and goggles.'),
            _buildStep(3, 'Carefully disconnect the battery cable. Look for the negative battery cable. It should be black and have a minus sign on it.'),
            _buildStep(4, 'Wait until the belt has cooled down.'),
            _buildStep(5, 'Slowly start turning the belt to examine it for any cracks and damage.'),
            const SizedBox(height: 20),
            const Text(
              'When do you have to replace it?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryTeal),
            ),
            const SizedBox(height: 10),
            const Text('Replace it when you find any of the following phenomena in your belt:'),
            const SizedBox(height: 10),
            const Text('• A linear belt wear and a belt with a non-constant section width\n'
                '• The cord between ropes\n'
                '• Cracked legs, composed section lines / tension lines\n'
                '• The belt cord separating out'),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(int number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.primaryTeal,
            child: Text('$number', style: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }
}

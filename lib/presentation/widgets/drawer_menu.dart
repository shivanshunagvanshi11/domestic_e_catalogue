import 'package:flutter/material.dart';
import 'package:domestic_e_catalogue/core/constants/app_colors.dart';
import 'package:domestic_e_catalogue/presentation/screens/home/home_screen.dart';
import 'package:domestic_e_catalogue/presentation/screens/announcements/announcements_screen.dart';
import 'package:domestic_e_catalogue/presentation/screens/about/about_screen.dart';
import 'package:domestic_e_catalogue/presentation/screens/technical_info/technical_info_screen.dart';
import 'package:domestic_e_catalogue/presentation/screens/contact/contact_screen.dart';
import 'package:domestic_e_catalogue/presentation/screens/guides/belt_installation_guide.dart';
import 'package:domestic_e_catalogue/presentation/screens/about/asli_naqli_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFA2D2CD),
      child: Column(
        children: [
          const SizedBox(height: 40),
          _buildDrawerItem(
            title: 'Home',
            isSelected: true,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
            },
          ),
          _buildDrawerItem(
            title: 'Contact Us',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactScreen()));
            },
          ),
          _buildDrawerItem(
            title: 'About Us',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutScreen()));
            },
          ),
          _buildDrawerItem(
            title: 'Belt Installation Guide',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const BeltInstallationGuideScreen()));
            },
          ),
          _buildDrawerItem(
            title: 'Asli Naqli',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AsliNaqliScreen()));
            },
          ),
          _buildDrawerItem(
            title: 'Oilseals-Features & Types',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const TechnicalInfoScreen()));
            },
          ),
          _buildDrawerItem(
            title: 'Announcements',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AnnouncementsScreen()));
            },
          ),
          _buildDrawerItem(
            title: 'About App',
            onTap: () {
              // Can reuse AboutScreen or a specific AboutAppScreen
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({required String title, bool isSelected = false, required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryTeal : Colors.transparent,
        border: const Border(bottom: BorderSide(color: Colors.white24, width: 0.5)),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.darkGrey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

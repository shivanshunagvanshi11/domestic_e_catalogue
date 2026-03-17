import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/catalog_provider.dart';
import '../home/home_screen.dart';
import '../../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    _initData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initData() async {
    final provider = Provider.of<CatalogProvider>(context, listen: false);
    await provider.loadInitialData();
    
    // Artificial delay to show animation
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE0F2F1), Colors.white],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              const SizedBox(height: 80),
              // Logo Section
              Column(
                children: [
                  Image.asset(
                    'assets/images/Fenner-logo.png',
                    height: 80,
                    errorBuilder: (context, error, stackTrace) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: AppColors.darkGrey,
                              padding: const EdgeInsets.all(4),
                              child: const Text('F', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                            ),
                            const Text(' Fenner', style: TextStyle(color: AppColors.primaryTeal, fontSize: 40, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const Text('J.K. Fenner (India) Limited', style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Center Text
              const Text(
                'Auto After Market Domestic',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTeal,
                ),
              ),
              const Text(
                'Product Guide',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              // Bottom Section
              const Text(
                'JK Pioneer',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00ACC1),
                ),
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.black12,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryTeal),
                  minHeight: 2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please wait... Product catalogue is loading',
                style: TextStyle(fontSize: 10, color: Colors.black54, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

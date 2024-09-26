import 'package:flutter/material.dart';
import '../dashboard_screen.dart';

class TicketCreatedScreen extends StatefulWidget {
  const TicketCreatedScreen({super.key});

  @override
  State<TicketCreatedScreen> createState() => _TicketCreatedScreenState();
}

class _TicketCreatedScreenState extends State<TicketCreatedScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController and the Scale Animation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Duration for the scaling effect
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation
    _controller.forward();

    // Delay for 3 seconds and navigate to DashboardScreen
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    });
  }

  @override
  void dispose() {
    // Dispose the animation controller to free resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedBuilder to apply the scaling effect to the image
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child, // The image itself
                );
              },
              child: Image.asset(
                'assets/images/wipro_logo.png',
                // width: 200,
                // height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '** Ticket Created Successfully **',
              style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

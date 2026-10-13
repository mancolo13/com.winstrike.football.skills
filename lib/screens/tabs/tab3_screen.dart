import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab3Screen extends StatefulWidget {
  const Tab3Screen({super.key});

  @override
  State<Tab3Screen> createState() => _Tab3ScreenState();
}

class _Tab3ScreenState extends State<Tab3Screen> {
  double _bestSpeed = 32.8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WinStrike • Speed'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  const Icon(Icons.speed, size: 40, color: AppTheme.primaryColor),
                  const SizedBox(height: 8),
                  Text('$_bestSpeed км/ч', style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  const Text('Максимальная зафиксированная скорость', style: TextStyle(color: Colors.white60, fontSize: 12)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => setState(() => _bestSpeed += 0.2),
                    style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor, foregroundColor: Colors.black),
                    child: const Text('Зафиксировать новый спринт'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Нормативы и тесты', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildStatCard('Спринт 30 метров', '4.12 сек', 'Топ 10% среди игроков', Icons.timer_outlined),
            _buildStatCard('Челночный бег 5x10м', '11.8 сек', 'Отличная координация', Icons.swap_horiz),
            _buildStatCard('Йо-йо интервальный тест', 'Уровень 18.4', 'Выносливость на 90 минут', Icons.favorite_border),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String val, String sub, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.cardColor, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
            child: Icon(icon, color: AppTheme.primaryColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text(sub, style: const TextStyle(color: Colors.white60, fontSize: 12)),
              ],
            ),
          ),
          Text(val, style: const TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }
}

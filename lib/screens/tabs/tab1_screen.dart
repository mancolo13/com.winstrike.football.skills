import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  int _completedDrills = 3;
  final List<Map<String, dynamic>> _drills = [
    {'title': 'Зигзаг между конусами', 'cat': 'Дриблинг', 'mins': '15 мин', 'done': true},
    {'title': 'Точность удара в девятку', 'cat': 'Удары', 'mins': '20 мин', 'done': true},
    {'title': 'Пас в одно касание у стены', 'cat': 'Передачи', 'mins': '12 мин', 'done': true},
    {'title': 'Рывок с мячом 30 метров', 'cat': 'Скорость', 'mins': '10 мин', 'done': false},
    {'title': 'Финт Зидана и смена темпа', 'cat': 'Дриблинг', 'mins': '15 мин', 'done': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WinStrike • Drills'),
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
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.35)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('ТРЕНИРОВКА ДНЯ', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold, fontSize: 11)),
                      ),
                      const Text('🔥 Уровень: Профи', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Контроль мяча & Скоростной Дриблинг', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const Text('45 мин • 4 упражнения • 320 ккал', style: TextStyle(color: Colors.white60, fontSize: 13)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: _completedDrills / _drills.length,
                            minHeight: 8,
                            backgroundColor: Colors.white12,
                            valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text('$_completedDrills/${_drills.length}', style: const TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text('Список упражнений', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ..._drills.map((d) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppTheme.cardColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: d['done'] as bool ? AppTheme.primaryColor.withValues(alpha: 0.2) : Colors.white10,
                    radius: 18,
                    child: Icon(
                      d['done'] as bool ? Icons.check : Icons.sports_soccer,
                      color: d['done'] as bool ? AppTheme.primaryColor : Colors.white38,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(d['title'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                        Text('${d["cat"]} • ${d["mins"]}', style: const TextStyle(color: Colors.white60, fontSize: 12)),
                      ],
                    ),
                  ),
                  Checkbox(
                    value: d['done'] as bool,
                    activeColor: AppTheme.primaryColor,
                    checkColor: Colors.black,
                    onChanged: (val) {
                      setState(() {
                        d['done'] = val ?? false;
                        _completedDrills = _drills.where((x) => x['done'] == true).length;
                      });
                    },
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

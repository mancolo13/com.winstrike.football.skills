import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final matches = [
      {'vs': 'vs Сокол FC', 'score': '3 : 1', 'res': 'Победа', 'win': true, 'stats': '2 гола • 1 ассист'},
      {'vs': 'vs Авангард', 'score': '2 : 2', 'res': 'Ничья', 'win': false, 'stats': '1 ассист • 84 мин'},
      {'vs': 'vs Металлург', 'score': '4 : 0', 'res': 'Победа', 'win': true, 'stats': '1 гол • 90 мин'},
      {'vs': 'vs Торпедо', 'score': '1 : 2', 'res': 'Поражение', 'win': false, 'stats': '70 мин • 4 удара'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • Matches'),
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('14', style: TextStyle(color: AppTheme.primaryColor, fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('Матчей', style: TextStyle(color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('9', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('Голов', style: TextStyle(color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('6', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('Ассистов', style: TextStyle(color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('7.8', style: TextStyle(color: AppTheme.secondaryColor, fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('Рейтинг', style: TextStyle(color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('История последних игр', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...matches.map((m) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.cardColor, borderRadius: BorderRadius.circular(14)),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: (m['win'] as bool) ? Colors.green.withValues(alpha: 0.2) : Colors.orange.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(m['score'] as String, style: TextStyle(color: (m['win'] as bool) ? Colors.greenAccent : Colors.orangeAccent, fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(m['vs'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                        Text(m['stats'] as String, style: const TextStyle(color: Colors.white60, fontSize: 12)),
                      ],
                    ),
                  ),
                  Text(m['res'] as String, style: TextStyle(color: (m['win'] as bool) ? Colors.greenAccent : Colors.white60, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

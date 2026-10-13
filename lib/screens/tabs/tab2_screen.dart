import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab2Screen extends StatefulWidget {
  const Tab2Screen({super.key});

  @override
  State<Tab2Screen> createState() => _Tab2ScreenState();
}

class _Tab2ScreenState extends State<Tab2Screen> {
  String _selectedFormation = '4-3-3 Атакующая';

  final List<Map<String, String>> _tactics = [
    {'title': 'Высокий прессинг', 'desc': 'Давление на защитников при первом пасе вратаря.'},
    {'title': 'Быстрый переход в атаку', 'desc': 'Выход из обороны через вертикальный пас в центр.'},
    {'title': 'Перегруз полуфланга', 'desc': 'Создание численного преимущества 3 в 2 на фланге.'},
    {'title': 'Компактный средний блок', 'desc': 'Сужение линий защиты и полузащиты при позиционной обороне.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WinStrike • Tactics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Тактическая расстановка', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  const SizedBox(height: 6),
                  Text(_selectedFormation, style: const TextStyle(color: AppTheme.primaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 14),
                  Row(
                    children: ['4-3-3', '4-2-3-1', '3-5-2', '4-4-2'].map((f) {
                      final sel = _selectedFormation.startsWith(f);
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedFormation = '$f ${sel ? "" : "Атакующая"}'),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: sel ? AppTheme.primaryColor : AppTheme.cardColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                f,
                                style: TextStyle(
                                  color: sel ? Colors.black : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Принципы игры команды', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ..._tactics.map((t) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.cardColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.shield_outlined, color: AppTheme.primaryColor, size: 18),
                      const SizedBox(width: 8),
                      Text(t['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(t['desc']!, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.3)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

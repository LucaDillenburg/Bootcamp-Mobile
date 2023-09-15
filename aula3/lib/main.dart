import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  @override
  State<Page> createState() => _PageState();
}

bool isSameDay(DateTime day1, DateTime day2) =>
    day1.day == day2.day && day1.month == day2.month && day1.year == day2.year;

class _PageState extends State<Page> {
  var _selectedDates = [DateTime.now()];

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(color: Colors.red, width: 100, height: 100),
                    Container(color: Colors.blue, width: 100, height: 100),
                  ],
                ),
                Row(
                  children: [
                    Container(color: Colors.red, width: 100, height: 100),
                    Container(color: Colors.blue, width: 100, height: 100),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final day = today.add(Duration(days: index));
                  final isSelected = _selectedDates.any((selectedDate) => isSameDay(day, selectedDate));
                  return GestureDetector(
                    onTap: () {
                      if (!isSelected) {
                        setState(() => _selectedDates.add(day));
                      } else {
                        setState(() {
                          _selectedDates = _selectedDates.where((d) => !isSameDay(day, d)).toList();
                        });
                      }
                    },
                    child: DaySelector(day: day, isSelected: isSelected),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DaySelector extends StatefulWidget {
  final DateTime day;
  final bool isSelected;
  const DaySelector({required this.day, required this.isSelected});

  @override
  State<DaySelector> createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  String _parseWeekday(int day) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[day - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.isSelected ? Colors.grey[800] : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey[400]!,
                width: 2,
              ),
            ),
            child: Text(
              '${widget.day.day}',
              style: TextStyle(fontSize: 18, color: widget.isSelected ? Colors.white : Colors.grey[800]),
            ),
          ),
          Text(_parseWeekday(widget.day.weekday)),
        ],
      ),
    );
  }
}

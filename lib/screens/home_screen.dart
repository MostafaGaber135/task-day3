import 'package:flutter/material.dart';
import 'package:task_day3/widgets/custom_drawer.dart';
import 'package:task_day3/widgets/custom_task.dart';
import 'package:task_day3/widgets/custom_text_field_task.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});
  static const String routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _taskController = TextEditingController();

  List<Map<String, dynamic>> tasks = [];

  void _addTask() {
    if (_taskController.text.trim().isNotEmpty) {
      setState(() {
        tasks.add({'title': _taskController.text.trim(), 'isCompleted': false});
        _taskController.clear();
      });
    }
  }

  void _toggleComplete(int index) {
    setState(() {
      tasks[index]['isCompleted'] = !tasks[index]['isCompleted'];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Daily Tasks',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
          ),
        ),
        leading: Builder(
          builder:
              (context) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  color: const Color(0XFFde5d56),
                  child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu_outlined),
                  ),
                ),
              ),
        ),
      ),
      drawer: CustomDrawer(userName: widget.userName, tasks: tasks),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
        child: Column(
          children: [
            CustomTextFieldTask(controller: _taskController),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF752ECF),
                minimumSize: const Size(325, 66),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: const Text(
                '📝 add tasks',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'To do Tasks',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return CustomTask(
                    title: tasks[index]['title'],
                    isCompleted: tasks[index]['isCompleted'],
                    onToggleComplete: () => _toggleComplete(index),
                    onDelete: () => _deleteTask(index),
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

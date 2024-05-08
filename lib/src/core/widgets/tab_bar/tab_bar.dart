import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavigatonPage extends ConsumerStatefulWidget {
  const BottomNavigatonPage({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  ConsumerState<BottomNavigatonPage> createState() =>
      _BottomNavigatonPageState();
}

class _BottomNavigatonPageState extends ConsumerState<BottomNavigatonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.child.currentIndex,
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_sharp),
            label: 'Карта',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Пользователь',
          ),
        ],
      ),
    );
  }
}

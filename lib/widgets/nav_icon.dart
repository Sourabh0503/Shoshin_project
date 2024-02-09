import 'package:flutter/material.dart';

class NavIcon extends StatefulWidget {
  const NavIcon(
      {super.key,
      required this.color,
      required this.icon,
      required this.title,
      required this.selected});
  final Color color;
  final bool selected;
  final IconData icon;
  final String title;

  @override
  State<NavIcon> createState() => _NavIconState();
}

class _NavIconState extends State<NavIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 85,
          decoration: BoxDecoration(
            color: widget.selected
                ? widget.color.withOpacity(0.1)
                : Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    width: 3,
                    color: widget.selected ? widget.color : Colors.white)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          child: Column(
            children: [
              Icon(
                widget.icon,
                color: widget.color,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(widget.title),
            ],
          ),
        ),
      ],
    );
  }
}

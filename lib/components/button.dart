import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool rotate;
  final void Function() action;

  const Button({
    Key? key,
    required this.text,
    required this.icon,
    this.rotate = false,
    required this.action,
  }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xff2d9af7), Color(0xff2dc9fe)],
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: widget.action,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              widget.rotate
                  ? RotationTransition(
                      turns: _animation,
                      child: Icon(
                        widget.icon,
                        color: Colors.white,
                      ),
                    )
                  : Icon(
                      widget.icon,
                      color: Colors.white,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

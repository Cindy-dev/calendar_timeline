import 'package:flutter/material.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  const DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    required this.dayTextStyle,
    this.isSelected = false,
    this.dayColor,
    this.activeDayColor,
    this.activeDayBackgroundColor,
    this.available = true,
    this.dotsColor,
    this.dayNameColor,
    this.shrink = false,
  }) : super(key: key);
  final int dayNumber;
  final String shortName;
  final bool isSelected;
  final Function onTap;
  final Color? dayColor;
  final Color? activeDayColor;
  final TextStyle? dayTextStyle;
  final Color? activeDayBackgroundColor;
  final bool available;
  final Color? dotsColor;
  final Color? dayNameColor;
  final bool shrink;

  // Stack

  Widget _buildDay(BuildContext context) {
    final selectedStyle = dayTextStyle;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: available ? onTap as void Function()? : null,
          child: Container(
            height: shrink ? 150 : 170,
            width: shrink ? 36 : 48,
            margin: const EdgeInsets.only(right: 19, top: 10),
            //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 11),
            decoration: BoxDecoration(
              color: isSelected ? activeDayBackgroundColor : Color(0xffEBEBEB),
              borderRadius: BorderRadius.circular(43),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    shortName,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Flexible(
                  child: Text(
                    dayNumber.toString(),
                    style: isSelected
                        ? selectedStyle
                        : TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isSelected)
          Positioned(
              left: 0,
              top: 3,
              right: 20,
              child: Container(
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                  color: Color(0xffFFB300),
                  shape: BoxShape.circle,
                ),
              )
              //_buildDots()
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDay(context);
  }
}

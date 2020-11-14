import 'package:flutter/material.dart';
import '../constants.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    this.label,
    this.max,
    this.min,
    this.onPressed,
    @required this.sliderValue,
  });

  final num min;
  final num max;
  final double sliderValue;
  final Function onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            label,
            style: kSecStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              sliderValue.toStringAsFixed(1),
              style: kMainStyle,
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  label == 'HEGHIT' ? 'Cm' : 'Kg',
                  style: kSecStyle,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                FlatButton.icon(
                  label: upDownLabel('+ 0.1'),
                  icon: upDownIcon(Icons.arrow_drop_up),
                  onPressed: () => onPressed(sliderValue + 0.1),
                ),
                FlatButton.icon(
                    label: upDownLabel('- 0.1'),
                    icon: upDownIcon(Icons.arrow_drop_down),
                    onPressed: () => onPressed(sliderValue - 0.1)),
              ],
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbColor: activeColor,
            trackHeight: 7.0,
            overlayColor: Colors.white30,
          ),
          child: Slider(
            value: sliderValue,
            inactiveColor: Colors.white54,
            activeColor: activeColor,
            onChanged: (double sliderValueChanged) =>
                onPressed(sliderValueChanged),
            min: min,
            max: max,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final TextStyle labelStyle;

  const AppCheckbox(
      {Key key, this.label, this.value, this.onChanged, this.labelStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: value,
              onChanged: onChanged,
              activeColor: Theme.of(context).primaryColor),
          Flexible(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: labelStyle,)),
        ],
      ),
    );
  }
}

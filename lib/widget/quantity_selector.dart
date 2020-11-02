import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class QuantitySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Quantity', style: quantityStyle),
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black.withOpacity(0.06),
                ),
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: Text('―', style: quantityIconStyle),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text('1',
                    style: quantityIconStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 18)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black.withOpacity(0.05),
                ),
                alignment: Alignment.center,
                width: 36,
                height: 36,
                child: Text('+', style: quantityIconStyle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shop_app/models/boarding_model/boarding_model.dart';


Widget build_boarding_item(BoardingModel on_boarding_item) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            child: Image(
              image: AssetImage(on_boarding_item.image),
            ),
          ),
        ),
        Text(
          on_boarding_item.title,
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          on_boarding_item.body,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );


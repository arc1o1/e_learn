import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(15),
        itemCount: 7,
        separatorBuilder: (_, __) => SizedBox(height: 10),
        itemBuilder: (_, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // icon
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorStrings.primary),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.circle,
                  color: ColorStrings.primary,
                  size: 12,
                ),
              ),

              SizedBox(width: 8),

              // texts
              Container(
                width: MediaQuery.of(context).size.width * 0.82,
                color: Colors.transparent,
                child: Text(
                  "Marking scheme for Mathematics previous week test has just been unlocked, check it out!.",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

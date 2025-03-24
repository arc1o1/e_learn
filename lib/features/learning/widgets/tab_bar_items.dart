import 'package:flutter/material.dart';

class TabBarItems extends StatelessWidget {
  const TabBarItems({
    super.key,
    required this.title,
    required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    // var
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // title
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 16, color: Colors.white),
          ),

          // create a container for overlay color display
          count > 0
              ? Container(
                  margin: const EdgeInsetsDirectional.only(start: 5),
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      count > 9 ? "9+" : count.toString(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

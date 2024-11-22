 import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerlistviewAllnews extends StatelessWidget {
  const ShimmerlistviewAllnews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey,
                      ),
                      margin: EdgeInsets.only(right: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          child: AspectRatio(
                            aspectRatio: 4 / 1,
                          ),
                        ),
                      ),
                    )),
              );
            }));
  }
}

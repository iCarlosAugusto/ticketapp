import 'package:flutter/material.dart';
import 'package:ticketapp/components/text.widget.dart';

class ListWidget extends StatelessWidget {

  ListWidget({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.separatorBuilder,
    this.customEmpty,
    this.isLoading,
    this.scrollDirection = Axis.vertical,
    this.physics,
    this.isEmpty
  });

  Widget? Function(BuildContext, int) itemBuilder;
  Widget Function(BuildContext, int)? separatorBuilder;
  Widget? customEmpty;
  Axis scrollDirection = Axis.vertical;
  ScrollPhysics? physics;
  int itemCount;
  bool? isLoading;
  bool? isEmpty;

  @override
  Widget build(BuildContext context) {
    return itemCount == 0 && isLoading == false 
      ? Expanded(
          child: Center(
            child: (
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                    Visibility(
                      visible: customEmpty == null,
                      replacement: Container(child: customEmpty),
                      child: const TextWidget(
                        "Encontramos nada por aqui",
                        textAlign: TextAlign.center,
                      )
                    )
                ],
              )
            ),
          ),
        ) 
      : Expanded(
        child: isLoading != null && isLoading == true 
          ? const Center(
            child: CircularProgressIndicator.adaptive()
          )
          : ListView.separated(
            shrinkWrap: true,
            scrollDirection: scrollDirection,
            physics: physics,
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder ?? (_, __) =>  Container(height: 16),
            itemCount: itemCount
        )
      );
    }
}
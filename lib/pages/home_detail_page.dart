import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import '../utils/widgets/home_widgets/add_to_cart.dart';

class HomeDetailPage extends StatefulWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  bool? returnPolicyValue;
  late int selectedRadio;
  bool bengaluruChecked = false;
  bool mumbaiChecked = false;
  bool ahmedabadChecked = false;

  @override
  void initState(){
    super.initState();
    selectedRadio = 0;

  }

  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${widget.catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: widget.catalog).wh(120, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(

        child: Column(children: [
          Hero(
                  tag: Key(widget.catalog.id.toString()),
                  child: Image.network(widget.catalog.image))
              .h32(context),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.convey,
            edge: VxEdge.top,
            child: Container(
              color: context.cardColor,
               width: context.screenWidth,
              child: Column(
                children: [
                  widget.catalog.name.text.xl4
                      .color(context.theme.focusColor)
                      .bold
                      .make(),
                  3.heightBox,
                  widget.catalog.desc.text.textStyle(context.captionStyle).color(Colors.grey).make(),
                  10.heightBox,
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in felis euismod, elementum elit nec, accumsan elit. Quisque id nulla eu risus condi tincidunt neque bibendum.  "
                  .text.color(Colors.grey).textStyle(context.captionStyle)
                  .make().p16(),

                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text("Return Policy: ",style: TextStyle(color: Colors.grey)),

                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.deepPurple, // Customize the border color
                                width: 1,
                              ),
                            ),
                            child: Radio(
                              value: 1,
                              groupValue: selectedRadio,
                              activeColor: Colors.deepPurple,
                              onChanged: (val) {
                                setSelectedRadio(val!);
                              },
                            ),
                          ),
                          Text("Yes",style: TextStyle(color: Colors.grey),), // Add text for the first radio button
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.deepPurple, // Customize the border color
                                width: 1,
                              ),
                            ),
                            child: Radio(
                              value: 2,
                              groupValue: selectedRadio,
                              activeColor: Colors.deepPurple,
                              onChanged: (val) {
                                setSelectedRadio(val!);
                              },
                            ),
                          ),
                          Text("No",style: TextStyle(color: Colors.grey)), // Add text for the second radio button
                        ],
                      ),
                    ],
                  ).h4(context),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text("Service Center Available: ",style: TextStyle(color: Colors.grey)),
                          Checkbox(
                            value: bengaluruChecked, // Define these boolean variables
                            activeColor: Colors.deepPurple,
                            onChanged: (value) {
                              setState(() {
                                bengaluruChecked = value!;
                              });
                            },
                          ),
                          Text("Bengaluru",style: TextStyle(color: Colors.grey)),
                          Checkbox(
                            value: mumbaiChecked, // Define these boolean variables
                            activeColor: Colors.deepPurple,
                            onChanged: (value) {
                              setState(() {
                                mumbaiChecked = value!;
                              });
                            },
                          ),
                          Text("Mumbai",style: TextStyle(color: Colors.grey)),
                          Checkbox(
                            value: ahmedabadChecked, // Define these boolean variables
                            activeColor: Colors.deepPurple,
                            onChanged: (value) {
                              setState(() {
                                ahmedabadChecked = value!;
                              });
                            },
                          ),
                          Text("Ahmedabad",style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ).py64(),
            ),
          ))
        ],
        ),
      ),
    );
  }
}

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:unnicum_mobile/widgets/custom_button.dart';

class AddVideoStep1Page extends StatelessWidget {
  const AddVideoStep1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.197044334975369,
            left: MediaQuery.of(context).size.width * 0.0426666666666667,
            right: MediaQuery.of(context).size.width * 0.0426666666666667,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Step 1',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0061576354679803,
                ),
                child: Text(
                  'Record or Upload Your Content',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0541871921182266,
                ),
                height: MediaQuery.of(context).size.height * 0.233990147783251,
                width: MediaQuery.of(context).size.width * 0.914666666666667,
                decoration: DottedDecoration(
                  strokeWidth: 1.75,
                  color: Colors.black,
                  shape: Shape.box,
                ),
                child: Icon(
                  Icons.circle,
                  size: MediaQuery.of(context).size.width * 0.186666666666667,
                  color: Color.fromRGBO(196, 196, 196, 1),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.125615763546798,
                  left: MediaQuery.of(context).size.width * 0.088,
                  right: MediaQuery.of(context).size.width * 0.0666666666666667,
                ),
                child: CustomButton(content: 'Next', func: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

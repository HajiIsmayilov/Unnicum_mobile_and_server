import 'package:unnicum_mobile/pages/search_subcategory.dart';
import 'package:unnicum_mobile/routes/fade_route.dart';
import 'package:flutter/material.dart';

class SubCategoryTile extends StatelessWidget {
  final String subCategory;

  SubCategoryTile({
    required this.subCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.0426666666666667,
        bottom: MediaQuery.of(context).size.height * 0.0369458128078818,
      ),
      child: Row(
        children: [
          Container(
            color: Color.fromRGBO(196, 196, 196, 1),
            height: MediaQuery.of(context).size.height * 0.0800492610837438,
            width: MediaQuery.of(context).size.width * 0.173333333333333,
          ),
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.0266666666666667,
            ),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      FadeRoute(
                          page: SearchSubCategoryPage(
                        subCategory: '',
                      )));
                },
                child: Text(
                  subCategory,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
          )
        ],
      ),
    );
  }
}

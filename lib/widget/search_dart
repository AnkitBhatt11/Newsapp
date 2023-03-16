import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/color&font/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
} // use nhi

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget spacevert = SizedBox(
      height: size.height * 0.04,
    );
    Widget spacevert5 = SizedBox(
      height: size.height * 0.03,
    );
    Widget spacehort = SizedBox(
      width: size.width * 0.06,
    );
    Widget spacevert1 = SizedBox(
      height: size.height * 0.02,
    );
    return Scaffold(
      body: Column(
        children: [
          spacevert,
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: TextField(
              autofocus: false,
              style: TextStyle(fontSize: 15.0, color: black(context)),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  // color: black(context),
                ),
                filled: true,
                fillColor: white(context),
                hintText: 'Search',
                hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 14),
                ),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: text8),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: text8),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

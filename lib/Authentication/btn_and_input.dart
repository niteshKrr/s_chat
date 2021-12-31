import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:s_chat/Friend_list/details_user/details.dart';
import 'package:s_chat/Friend_list/listpage.dart';

class Btn extends StatelessWidget {
  final bool flag;
  const Btn(this.flag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String txt = flag ? 'Log In' : 'Sign Up';
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue[900]),
      child: TextButton(
        onPressed: () async {
          var ussr = await fetchUserDetails('LanaRhodes');
          final usr = jsonDecode(ussr.body);
          usrname = usr['name'];
          phoneNo = usr['phone_no'];
          for (String k in usr['friends'].keys) {
            friends.add(usr['friends'][k]);
          }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ListPage()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txt,
              style: const TextStyle(color: Colors.white, fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }

  void sendOtp(String numb) {}
}

class TxtWidget extends StatelessWidget {
  final String txt;
  final IconData ic;
  final TextInputType tp;
  const TxtWidget(this.txt, this.ic, this.tp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      keyboardType: tp,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixIcon: Icon(ic),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: txt,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

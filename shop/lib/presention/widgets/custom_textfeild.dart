import 'package:flutter/material.dart';

Widget defaulttextfield({
  required TextEditingController controller,
  required TextInputType keyboardtyp,
  onsubmitted,
  onchange,
  bool ispassword=false,
  required vaildat,
  required String label,
  required IconData perfix,
   IconData? suffix,
  sufixpressed,
})=>      TextFormField(

                    onFieldSubmitted: onsubmitted,
                    onChanged: onchange,
                    validator: vaildat,
                    keyboardType: keyboardtyp,
                    controller: controller,
                    obscureText: ispassword,
                    decoration: InputDecoration(
                        prefix: Icon(perfix),
                        suffixIcon:suffix!=null? IconButton(icon: Icon(suffix), onPressed:sufixpressed ,):null,
                        labelText:label,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0))),
                  );
                  

                  
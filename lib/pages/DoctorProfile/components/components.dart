import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:flutter/material.dart';

class DPLoginText extends StatelessWidget {
  const DPLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        "Doctor Profile",
        style: TextStyle(
            fontFamily: 'Kumbh',
            fontSize: 42,
            fontWeight: FontWeight.w900,
            color: AppColorsys.xprimary),
      ),
    );
  }
}

class DPLoginTextFieldSection extends StatelessWidget {
  const DPLoginTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          spacing: 30.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DPLoginTextFieldBar(
                hintext: "Enter full name", labeltext: "Full Name"),
            DPLoginTextFieldBar(
                hintext: "Enter Qualification", labeltext: "Qualification"),
            DPLoginTextFieldBar(
                hintext: "Enter Specialization", labeltext: "Specialization"),
            DPLoginTextFieldBar(
                hintext: "Enter years of experience", labeltext: "Experience"),
            DPLoginTextFieldBar(
                hintext: "Enter Lincense No.", labeltext: "License No."),
            DPLoginTextFieldBar(
                hintext: "Enter Clinic name", labeltext: "Clinic Name"),
            DPLoginTextFieldBar(
                hintext: "Enter Clinic Address", labeltext: "Clinic Address"),
            DPLoginTextFieldBar(
                hintext: "Enter Phone no.", labeltext: "Phone no."),
            DPLoginTextFieldBar(
                hintext: "Enter email ID", labeltext: "Email ID"),
            DPLoginTextFieldBar(
                hintext: "Enter Morning Timing", labeltext: "Morning Time"),
            DPLoginTextFieldBar(
                hintext: "Enter Evening Timing", labeltext: "Evening Timing"),
          ],
        ),
      ),
    );
  }
}

class DPLoginTextFieldBar extends StatelessWidget {
  final String hintext;
  final String labeltext;
  const DPLoginTextFieldBar(
      {super.key, required this.hintext, required this.labeltext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintext,
          labelText: labeltext,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(15.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(15.0))),
    );
  }
}

class DPLoginButton extends StatelessWidget {
  const DPLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(300, 50), backgroundColor: AppColorsys.xprimary),
        onPressed: () {},
        child: Text(
          "Create Profile",
          style: TextStyle(
              fontFamily: 'Kumbh',
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.white),
        ),
      ),
    );
  }
}

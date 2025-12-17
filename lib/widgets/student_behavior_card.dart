import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompetencyStatisticCard extends StatelessWidget {
  const CompetencyStatisticCard({
    super.key,
    required this.title,
    required this.value,
    this.status,
    required this.color,
    required this.valueColor,
    required this.icon,
  });

  final String title;
  final int value;
  final String? status;
  final String color;
  final String valueColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value.toString(),
                style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Color(int.parse(valueColor)),
                ),
              ),
              const SizedBox(height: 8),
              if (status != null && status!.isNotEmpty)
              Text(
                "● $status",
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(int.parse(color)),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(int.parse(color)).withOpacity(0.2),
              child: Icon(
                icon,
                color: Color(int.parse(color)),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
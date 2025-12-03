import 'package:flutter/material.dart';
import 'package:sidata_app/widgets/appbar.dart';

class ProjectWorkDetailPage extends StatelessWidget {
  const ProjectWorkDetailPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const AppbarProp(),

      body: Stack(
        children: [
          // ===== CONTENT MAIN =====
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 16),

                const Text(
                  'Daftar Project Work',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Kelola dan pantau progress project work Anda',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),

                Expanded(
                  child: ListView(
                    children: [
                      _buildProjectCard(
                        'Aplikasi Mobile E-Commerce',
                        'Flutter Development',
                        'Pak Istakim',
                        '28 Nov 2025',
                        'Selesai',
                        Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ===== TOMBOL KEMBALI =====
          Positioned(
            left: 16,
            bottom: 16,
            child: TextButton.icon(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF02398C),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadowColor: Colors.black.withOpacity(0.2),
                elevation: 4, 
              ),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 16,
              ),
              label: const Text(
                "Kembali",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ========================= CARD BUILDER =========================

  Widget _buildProjectCard(String title, String kompetensi, String guru,
      String tanggal, String status, Color statusColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          kompetensi,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildDetailRow('Kompetensi', kompetensi),
                const SizedBox(height: 12),
                _buildDetailRow('Guru', guru),
                const SizedBox(height: 12),
                _buildDetailRow('Tanggal', tanggal),
                const SizedBox(height: 12),
                _buildStatusRow('Status', status, statusColor),
                const SizedBox(height: 12),
                _buildDetailRow('Catatan Guru',
                    'Pekerjaan sudah sesuai dengan standar kompetensi yang diharapkan'),
                const SizedBox(height: 12),
                _buildDetailRow('Catatan Siswa',
                    'Terima kasih atas bimbingannya, saya akan terus belajar dan meningkatkan kemampuan'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ========================= DETAIL ROW =========================

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  // ========================= STATUS ROW =========================

  Widget _buildStatusRow(String label, String status, Color statusColor) {
    return Row(
      children: [
        Text(
          '$label:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: statusColor,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../model/transaction.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menerima data transaksi dari argumen rute
    final item = ModalRoute.of(context)!.settings.arguments as TransactionItem;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rincian Split-Bill'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Total Tagihan: Rp ${item.amount}', style: const TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.bold)),
                    const Divider(height: 24),
                    Text('Ditalangi oleh: ${item.payer}', style: const TextStyle(fontSize: 14)),
                    Text('Tanggal: ${item.date}', style: const TextStyle(fontSize: 14)),
                    Text('Kategori: ${item.category}', style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 12),
                    const Text('Catatan:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(item.note, style: TextStyle(color: Colors.grey.shade700)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Status Anggota Patungan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: item.participants.length,
              itemBuilder: (context, index) {
                final p = item.participants[index];
                return Card(
                  child: ListTile(
                    leading: Icon(
                      p.isPaid ? Icons.check_circle : Icons.cancel,
                      color: p.isPaid ? Colors.green : Colors.red,
                    ),
                    title: Text(p.name),
                    subtitle: Text('Bagian: Rp ${p.share}'),
                    trailing: Text(
                      p.isPaid ? 'Sudah Bayar' : 'Belum Bayar',
                      style: TextStyle(
                        color: p.isPaid ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
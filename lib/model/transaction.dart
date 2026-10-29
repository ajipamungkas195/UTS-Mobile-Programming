class Participant {
  final String name;
  final int share;
  final bool isPaid;

  Participant({
    required this.name,
    required this.share,
    required this.isPaid,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      name: json['name'],
      share: json['share'],
      isPaid: json['is_paid'],
    );
  }
}

class TransactionItem {
  final int id;
  final String title;
  final String category;
  final int amount;
  final String date;
  final String status;
  final String payer;
  final String note;
  final List<Participant> participants;

  TransactionItem({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.status,
    required this.payer,
    required this.note,
    required this.participants,
  });

  factory TransactionItem.fromJson(Map<String, dynamic> json) {
    var list = json['participants'] as List;
    List<Participant> participantList =
    list.map((i) => Participant.fromJson(i)).toList();

    return TransactionItem(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      amount: json['amount'],
      date: json['date'],
      status: json['status'],
      payer: json['payer'],
      note: json['note'],
      participants: participantList,
    );
  }
}
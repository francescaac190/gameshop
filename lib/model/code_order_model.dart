class CodeOrder {
  String title, date, amount, card, quantity, price;
  String? code;
  bool approved, pending;

  CodeOrder({
    required this.title,
    required this.date,
    required this.amount,
    required this.card,
    required this.quantity,
    required this.price,
    required this.approved,
    required this.pending,
    this.code,
  });
}

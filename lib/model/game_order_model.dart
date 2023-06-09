class GameOrder {
  String title, date, amount, accountType, accountId, password, game, price;

  bool approved, pending;

  GameOrder({
    required this.title,
    required this.date,
    required this.amount,
    required this.accountType,
    required this.accountId,
    required this.password,
    required this.game,
    required this.price,
    required this.approved,
    required this.pending,
  });
}

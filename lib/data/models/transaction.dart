class Transaction {
  final int id;
  final String type; // Income or Expense
  final String name;
  final double amount;
  final DateTime date;
  final String description;
  final int categoryId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transaction(
    this.id,
    this.type,
    this.name,
    this.amount,
    this.date,
    this.description,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  );
}

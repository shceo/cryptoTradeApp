class CryptoCoin {
  CryptoCoin(
      {required this.name,
      required this.price,
      required this.symbol,
      required this.change,
      required this.image,
      required this.rank});
  final String name;
  final String symbol;
  final double price;
  final double change;
  final String image;
  final int rank;
}

part of 'crypto_bloc_bloc.dart';


class CryptoBlocEvent {}
class CryptoLoadList extends CryptoBlocEvent{}
class CryptoLoadSearch extends CryptoBlocEvent{
  CryptoLoadSearch({required this.search});
  final String search;
}



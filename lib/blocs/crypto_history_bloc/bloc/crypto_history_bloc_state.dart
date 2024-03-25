part of 'crypto_history_bloc_bloc.dart';

@immutable
sealed class CryptoHistoryBlocState {}

final class CryptoHistoryBlocInitial extends CryptoHistoryBlocState {
  CryptoHistoryBlocInitial();

}
final class CryptoHistoryBlocIsLoaded extends CryptoHistoryBlocState {
  CryptoHistoryBlocIsLoaded({required this.cryptoHistoryList});
  final List<CryptoHistory> cryptoHistoryList;
}
final class CryptoHistoryBlocFailure extends CryptoHistoryBlocState {}
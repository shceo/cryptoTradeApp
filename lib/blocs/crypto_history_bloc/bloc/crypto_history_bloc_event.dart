part of 'crypto_history_bloc_bloc.dart';

@immutable
sealed class CryptoHistoryBlocEvent {}
class CryptoHistoryBlocIntervalEvent extends CryptoHistoryBlocEvent{
  CryptoHistoryBlocIntervalEvent({required this.interval , required this.name});
  final String name;
  final String interval;
}
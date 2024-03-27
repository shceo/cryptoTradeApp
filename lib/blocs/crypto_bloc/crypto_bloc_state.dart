part of 'crypto_bloc_bloc.dart';


class CryptoBlocState {}

class CryptoBlocInitial extends CryptoBlocState {}
class CryptoBlocIsLoading extends CryptoBlocState {}
class CryptoBlocIsLoaded extends CryptoBlocState {
  CryptoBlocIsLoaded({required this.coinsList});
  final List<CryptoCoin> coinsList;

  
  // List<Object> get props => [coinsList];
  
}
class CryptoBlocLoadingFailure extends CryptoBlocState {
  CryptoBlocLoadingFailure({required this.exception});
  final Object? exception;
}

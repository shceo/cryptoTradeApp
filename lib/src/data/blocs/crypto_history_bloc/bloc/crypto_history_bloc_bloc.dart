import 'package:bloc/bloc.dart';
import 'package:crypto_trader/src/data/api/api.dart';
import 'package:crypto_trader/src/data/models/crypto_history.dart';
import 'package:meta/meta.dart';

part 'crypto_history_bloc_event.dart';
part 'crypto_history_bloc_state.dart';

class CryptoHistoryBlocBloc
    extends Bloc<CryptoHistoryBlocEvent, CryptoHistoryBlocState> {
  CryptoHistoryBlocBloc() : super(CryptoHistoryBlocInitial()) {
    on<CryptoHistoryBlocIntervalEvent>((event, emit) async {
      try {
        final cryptoHistoryList = await CryptoCoinRepository()
            .getCryptoHistory(event.name, event.interval);
            emit(CryptoHistoryBlocIsLoaded(cryptoHistoryList: cryptoHistoryList));
        switch (event.interval) {
          case 'm5':
            emit(CryptoHistoryBlocIsLoaded(
                cryptoHistoryList:
                    cryptoHistoryList.sublist(cryptoHistoryList.length - 13)));
          case 'h2':
            emit(CryptoHistoryBlocIsLoaded(
                cryptoHistoryList:
                    cryptoHistoryList.sublist(cryptoHistoryList.length - 13)));
          case 'h6':
            emit(CryptoHistoryBlocIsLoaded(
                cryptoHistoryList:
                    cryptoHistoryList.sublist(cryptoHistoryList.length - 15)));
          case 'h12':
            emit(CryptoHistoryBlocIsLoaded(
                cryptoHistoryList:
                    cryptoHistoryList.sublist(cryptoHistoryList.length - 32)));
          case 'd1':
            emit(CryptoHistoryBlocIsLoaded(
                cryptoHistoryList:
                    cryptoHistoryList.sublist(cryptoHistoryList.length - 181)));
        }
      } catch (e) {}
    });
  }
}

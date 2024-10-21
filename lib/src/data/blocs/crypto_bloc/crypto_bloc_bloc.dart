import 'package:bloc/bloc.dart';
import 'package:crypto_trader/src/data/api/api.dart';
import 'package:crypto_trader/src/data/models/crytpo_coin.dart';

part 'crypto_bloc_event.dart';
part 'crypto_bloc_state.dart';

class CryptoBlocBloc extends Bloc<CryptoBlocEvent, CryptoBlocState> {
  CryptoBlocBloc() : super(CryptoBlocInitial()) {
    on<CryptoLoadList>((event, emit) async {
      try {
        emit(CryptoBlocIsLoading());
        final cryptoCoinList = await CryptoCoinRepository().getCryptoCoinList();
        emit(CryptoBlocIsLoaded(coinsList: cryptoCoinList));
      } catch (e) {
        emit(CryptoBlocLoadingFailure(exception: e));
      }
    });
    on<CryptoLoadSearch>((event, emit) async {
      try {
        List<CryptoCoin> search = [];
        emit(CryptoBlocIsLoading());
        final cryptoCoinList = await CryptoCoinRepository()
            .getCryptoCoinList();
        search = cryptoCoinList.where((element) => element.name.toLowerCase().contains(event.search)).toList();
        emit(CryptoBlocIsLoaded(coinsList: search));
      } catch (e) {
        emit(CryptoBlocLoadingFailure(exception: e));
      }
    });
  }
}

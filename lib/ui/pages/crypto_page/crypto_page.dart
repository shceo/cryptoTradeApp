import 'package:crypto_trader/blocs/crypto_bloc/crypto_bloc_bloc.dart';
import 'package:crypto_trader/blocs/crypto_history_bloc/bloc/crypto_history_bloc_bloc.dart';
import 'package:crypto_trader/components/crypto_line.dart';
import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CryptoBlocBloc, CryptoBlocState>(
      listener: (context, state) {},
      child: BlocBuilder<CryptoBlocBloc, CryptoBlocState>(
        builder: (context, state) {
          if (state is CryptoBlocIsLoaded) {
            final _cryptoBlocList = state.coinsList;
            return Scaffold(
              backgroundColor: CryptoColors.notblack,
              appBar: AppBar(
                backgroundColor: CryptoColors.notblack,
                leading: IconButton(
                  onPressed: () {
                    context.go(AppRoutes.home);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: CryptoColors.notwhite,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.network(_cryptoBlocList[index].image)),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${_cryptoBlocList[index].name}',
                      style:
                          TextStyle(fontSize: 16, color: CryptoColors.notwhite),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${_cryptoBlocList[index].symbol}',
                      style: TextStyle(fontSize: 10, color: CryptoColors.grey),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {}, //
                        icon: Icon(
                          Icons.star_border_outlined,
                          size: 16,
                          color: CryptoColors.notwhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: CryptoPageBody(
                index: index,
              ),
              persistentFooterAlignment: AlignmentDirectional.center,
              persistentFooterButtons: [
                SizedBox(
                    width: 164,
                    height: 48,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Text('Купить'),
                    )),
                SizedBox(
                  width: 16,
                ),
                SizedBox(
                    width: 164,
                    height: 48,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Text('Продать'),
                    ))
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class CryptoPageBody extends StatelessWidget {
  CryptoPageBody({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    final List period = ['1 H', '24 H', '1 W', '1 M', '6 M'];
    final List interval = ['m5', 'h2', 'h6', 'h12', 'd1'];
    return BlocListener<CryptoBlocBloc, CryptoBlocState>(
      listener: (context, state) {},
      child: BlocBuilder<CryptoBlocBloc, CryptoBlocState>(
        builder: (context, state) {
          if (state is CryptoBlocIsLoaded) {
            final String name = state.coinsList[index].name.toLowerCase();

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16, left: 16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${(state.coinsList[index].price).toStringAsFixed(2)} \$',
                                style: TextStyle(
                                    fontSize: 24, color: CryptoColors.grey),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                  '${(state.coinsList[index].change).toStringAsFixed(2)} %')
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: CryptoLine(name: name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, i) => FloatingActionButton(
                              heroTag: UniqueKey(),
                              onPressed: () {
                                context.read<CryptoHistoryBlocBloc>().add(
                                    CryptoHistoryBlocIntervalEvent(
                                        name:
                                            '${state.coinsList[index].name.toLowerCase()}',
                                        interval: interval[i]));
                              },
                              child: Text('${period[i]}'),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                            itemCount: period.length,
                          ),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        ListTile(
                          leading: Image.network(state.coinsList[index].image),
                          title: Text('${state.coinsList[index].name}', style: TextStyle(color: CryptoColors.notwhite),),
                          subtitle: Text('00.00 BTC'),
                          trailing: Text('00.00'),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListTile(
                          title: Text('Транзакции'),
                          trailing: Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

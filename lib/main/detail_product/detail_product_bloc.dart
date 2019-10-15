import 'package:app_desafio_inovacao/main/detail_product/detail_product_event.dart';
import 'package:app_desafio_inovacao/main/detail_product/detail_product_state.dart';
import 'package:bloc/bloc.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  @override
  DetailProductState get initialState => DetailProductState.initial();

  @override
  Stream<DetailProductState> mapEventToState(DetailProductEvent event) async* {
  }
}

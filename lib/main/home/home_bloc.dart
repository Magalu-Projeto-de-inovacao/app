import 'package:app_desafio_inovacao/repository/products_repository.dart';
import 'package:bloc/bloc.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeState.initial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is Search) {
      yield currentState.copyWith(loading: true, keySearch: '');
      try {
        final productsRepository = new ProductsRepository();
        final list = await productsRepository.read(query: event.query);
        yield currentState.copyWith(loading: false, list: list, keySearch: event.query);
      } catch (e) {
        yield currentState.copyWith(loading: false);
      }
    }
  }
}

import 'package:app_desafio_inovacao/main/request/request.dart';
import 'package:app_desafio_inovacao/repository/request_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  @override
  RequestState get initialState => RequestState.initial();

  @override
  Stream<RequestState> mapEventToState(RequestEvent event) async* {
    final requestRepository = new RequestRepository();
    if (event is Create) {
      try {
        print('currentState $currentState');
        yield currentState.copyWith(loading: true);
        await requestRepository.create(
            attribute: event.attribute,
            value: event.value,
            reason: event.reason,
            products: event.products);
        yield currentState.copyWith(loading: false, created: true);
        print('Finish');
      } catch (e) {
        print(e);
        yield currentState.copyWith(loading: false);
      }
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_slider_state.dart';
part 'start_slider_cubit.freezed.dart';

class StarterPageCubit extends Cubit<StarterPageSate> {
  StarterPageCubit() : super(const StarterPageSate.initial());

  onTilesLoaded() {
    emit(const StarterPageSate.initial());
  }
}

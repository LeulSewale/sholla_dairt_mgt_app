import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/dashboard_data.dart';
import '../../../domain/usecases/dashboard/get_dashboard_data_usecase.dart';
import '../../../core/usecases/usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardDataUseCase getDashboardDataUseCase;

  DashboardBloc(this.getDashboardDataUseCase) : super(DashboardInitial()) {
    on<LoadDashboardData>(_onLoadDashboardData);
  }

  void _onLoadDashboardData(LoadDashboardData event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    
    final result = await getDashboardDataUseCase(NoParams());
    
    result.fold(
      (failure) => emit(DashboardError(failure.message)),
      (data) => emit(DashboardLoaded(data)),
    );
  }
}

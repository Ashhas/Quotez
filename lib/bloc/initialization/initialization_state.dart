part of 'initialization_cubit.dart';

@immutable
abstract class InitializationState extends Equatable {}

class InitialState extends InitializationState {
  @override
  List<Object> get props => [];
}

class NoNetworkOnStartup extends InitializationState {
  @override
  List<Object> get props => [];
}

class InitializedState extends InitializationState {
  InitializedState();

  @override
  List<Object> get props => [];
}

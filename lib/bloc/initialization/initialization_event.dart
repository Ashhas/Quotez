part of 'initialization_bloc.dart';

@immutable
abstract class InitializationEvent extends Equatable {}

class InitializeApp extends InitializationEvent {
  @override
  List<Object> get props => [];
}

class ReloadWithNetwork extends InitializationEvent {
  @override
  List<Object> get props => [];
}

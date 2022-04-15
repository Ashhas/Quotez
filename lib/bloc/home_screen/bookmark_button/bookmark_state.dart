part of 'bookmark_cubit.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();
}

class BookmarkPressed extends BookmarkState {
  @override
  List<Object> get props => [];
}

class BookmarkNotPressed extends BookmarkState {
  @override
  List<Object> get props => [];
}
part of 'bottom_viewer_bloc.dart';

@immutable
sealed class BottomViewerState {}

final class BottomViewerInitial extends BottomViewerState {
  final int index;
  BottomViewerInitial({required this.index});
}

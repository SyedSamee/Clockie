part of 'bottom_viewer_bloc.dart';

@immutable
sealed class BottomViewerEvent {}

class BottomViewerMovedToNextScreen extends BottomViewerEvent {
  final int index;
  BottomViewerMovedToNextScreen({required this.index});
}

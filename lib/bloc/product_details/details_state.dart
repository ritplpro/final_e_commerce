abstract class DetailsState {}

class DetailsInitialState extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsScucessState extends DetailsState {}

class DetailsFailedState extends DetailsState {
  String errormsg;
  DetailsFailedState({required this.errormsg});
}


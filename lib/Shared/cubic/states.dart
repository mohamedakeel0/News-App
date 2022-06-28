abstract class NewsStates {}

class NewInitialState extends NewsStates {}

class NewBottomNavState extends NewsStates {}

class NewGetBusinessSuccessState extends NewsStates {}
class NewBusinessLoadingState extends NewsStates {}

class NewGetBusinessErrorState extends NewsStates {
  final String error;
  NewGetBusinessErrorState(this.error);
}

class NewGetScienceSuccessState extends NewsStates {}
class NewScienceLoadingState extends NewsStates {}

class NewGetScienceErrorState extends NewsStates {
  final String error;
  NewGetScienceErrorState(this.error);
}

class NewGetSportsSuccessState extends NewsStates {}
class NewSportsLoadingState extends NewsStates {}

class NewGetSportsErrorState extends NewsStates {
  final String error;
  NewGetSportsErrorState(this.error);
}


class NewGetSearchSuccessState extends NewsStates {}
class NewSearchLoadingState extends NewsStates {}

class NewGetSearchErrorState extends NewsStates {
  final String error;
  NewGetSearchErrorState(this.error);
}

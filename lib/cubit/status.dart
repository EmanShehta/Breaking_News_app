abstract class NewStates {

}
class NewInitialState extends NewStates {}
class NewBottomnav extends NewStates {}
class NewsgetbussinessSuccessStates extends NewStates {}
class NewsGetbussinessLoadingStates extends NewStates {}
class NewsgetbussinessErrorStates extends NewStates {
  final String error ;
  NewsgetbussinessErrorStates(this.error);
}
class NewsgetsportSuccessStates extends NewStates {}
class NewsGetsportLoadingStates extends NewStates {}
class NewsgetsportErrorStates extends NewStates {
  final String error ;
  NewsgetsportErrorStates(this.error);
}
class NewsgetscienceSuccessStates extends NewStates {}
class NewsGetscienceLoadingStates extends NewStates {}
class NewsgetscienceErrorStates extends NewStates {
  final String error ;
  NewsgetscienceErrorStates(this.error);

}
class AppchangemodeStates extends NewStates {}


class NewsgetscearchSuccessStates extends NewStates {}
class NewsGetscearchLoadingStates extends NewStates {}
class NewsgetscearchErrorStates extends NewStates {
  final String error ;
  NewsgetscearchErrorStates(this.error);

}



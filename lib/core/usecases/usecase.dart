//use cases are where the bussiness logic gets executed and it is getting data from repository and returns it
//this is base use case for other classes to impllement it for clean architecture
//use case class have callmethod that is why we created this abstrct class so other class also have this with its own implementation and have common functions
abstract class UseCase<Type,Params>{
  Future<Type> call({Params  params});
}
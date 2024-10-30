import 'package:app_dogs/data/models/dog_model.dart';
import 'package:app_dogs/data/repositories/dog_repository.dart';

class DogViewModel {
  final DogRepository repository;

  DogViewModel(this.repository);
  Future<void> addDog(Dog dog) async {
    await repository.insertDog(dog);
  }

  Future<List<Dog>> getDogs() async {
    return await repository.getDogs();
  }
}

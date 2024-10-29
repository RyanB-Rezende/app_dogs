import 'package:app_dogs/data/models/dog_model.dart';
import 'package:app_dogs/data/repositories/dog_repository.dart';

class DogViewmodel {
  final DogRepository repository;

  DogViewmodel(this.repository);

  Future<void> addDog(Dog dog) async {
    await repository.insertDog(dog);
  }
}

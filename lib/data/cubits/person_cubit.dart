import 'package:flutter_bloc/flutter_bloc.dart';

import '../data.dart';

class PersonCubit extends Cubit<PersonCubitState> {
  final PersonRepository _personRepository;

  List<Person> get persons => _personRepository.persons;

  PersonCubit({required PersonRepository personRepository})
      : _personRepository = personRepository,
        super(const PersonCubitState.init());

  Person addPerson(Person person) {
    emit(const PersonCubitState.loading());
    final newPerson = _personRepository.addPerson(person);
    emit(PersonCubitState.loaded(newPerson));
    return newPerson;
  }

  void deletePerson(Person person) {
    emit(const PersonCubitState.loading());
    _personRepository.removePerson(person);
    emit(PersonCubitState.loaded(person));
  }
}

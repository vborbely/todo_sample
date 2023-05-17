import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../data.dart';

class PersonCubit extends Cubit<PersonCubitState> {
  final PersonRepository _personRepository;

  Person? _person;

  set _selectPerson(Person person) {
    emit(const PersonCubitState.loading());
    _person = person;
    emit(PersonCubitState.loaded(
        persons: _personRepository.persons, selected: _person));
  }

  List<Person> get persons => _personRepository.persons;

  Person? get selected => _person;

  PersonCubit({required PersonRepository personRepository})
      : _personRepository = personRepository,
        super(const PersonCubitState.init());

  void loadPersons() {
    logger.d('PersonCubit.loadPersons');
    emit(const PersonCubitState.loading());
    _personRepository.loadPersons();
    emit(PersonCubitState.loaded(
        persons: _personRepository.persons, selected: _person));
  }

  Person addPerson(Person person) {
    emit(const PersonCubitState.loading());
    final newPerson = _personRepository.addPerson(person);
    emit(PersonCubitState.loaded(
        persons: _personRepository.persons, selected: _person));
    return newPerson;
  }

  void deletePerson(Person person) {
    emit(const PersonCubitState.loading());
    _personRepository.removePerson(person);
    emit(PersonCubitState.loaded(
        persons: _personRepository.persons, selected: _person));
  }

  void selectPerson(Person person) {
    _selectPerson = person;
  }
}

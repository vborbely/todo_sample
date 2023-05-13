import '../data.dart';

class PersonRepository {
  PersonRepository() {
    init();
  }

  final List<Person> _persons = [];

  List<Person> get persons => _persons;

  void init() {
    _persons.addAll([
      Person(
        id: 1,
        name: 'John',
        age: 20,
      ),
      Person(
        id: 2,
        name: 'Jane',
        age: 21,
      ),
      Person(
        id: 3,
        name: 'Jack',
        age: 22,
      ),
    ]);
  }

  Person addPerson(Person person) {
    final Person? newPerson;
    if (person.id == 0) {
      newPerson =
          Person(id: _persons.length + 1, name: person.name, age: person.age);
    } else {
      newPerson = person;
    }
    _persons.add(newPerson);
    return person;
  }

  void removePerson(Person person) {
    _persons.remove(person);
  }
}

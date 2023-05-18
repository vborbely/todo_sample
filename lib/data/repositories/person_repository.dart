import '../data.dart';

class PersonRepository {
  PersonRepository() {
    init();
  }

  final List<Person> _persons = [];

  List<Person> get persons => _persons;

  void init() {
    _persons.addAll([
      const Person(
        id: 1,
        name: 'John',
        email: "john@example.com",
      ),
      const Person(
        id: 2,
        name: 'Jane',
        email: "jane@example.com",
      ),
      const Person(
        id: 3,
        name: 'Jack',
        email: "jack@example.com",
      ),
    ]);
  }

  Person addPerson(Person person) {
    final Person? newPerson;
    if (person.id == 0) {
      newPerson = Person(
          id: _persons.length + 1, name: person.name, email: person.email);
    } else {
      newPerson = person;
    }
    _persons.add(newPerson);
    return person;
  }

  void removePerson(Person person) {
    _persons.remove(person);
  }

  void loadPersons() {
    _persons.clear();
    init();
  }
}

public class Main {
    public static void main(String[] args) {
        // Erstellen eines neuen Person-Objekts
        Person person = new Person("Nabil", 24);

        // Ausgabe der Person
        System.out.println(person);

        // Ändern des Namens und Alters
        person.setName("Finn");
        person.setAlter(20);

        // Ausgabe der aktualisierten Person
        System.out.println(person);
    }
}

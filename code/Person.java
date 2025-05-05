/**
 * Die Klasse Person repräsentiert eine Person mit einem Namen und einem Alter.
 */
public class Person {
    // Instanzvariablen
    private String name;
    private int alter;

    /**
     * Konstruktor für die Klasse Person.
     * Initialisiert den Namen und das Alter der Person.
     *
     * @param name  Der Name der Person.
     * @param alter Das Alter der Person.
     */
    public Person(String name, int alter) {
        this.name = name;
        this.alter = alter;
    }

    /**
     * Gibt den Namen der Person zurück.
     *
     * @return Der Name der Person.
     */
    public String getName() {
        return name;
    }

    /**
     * Setzt den Namen der Person.
     *
     * @param name Der neue Name der Person.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gibt das Alter der Person zurück.
     *
     * @return Das Alter der Person.
     */
    public int getAlter() {
        return alter;
    }

    /**
     * Setzt das Alter der Person.
     *
     * @param alter Das neue Alter der Person.
     */
    public void setAlter(int alter) {
        this.alter = alter;
    }

    /**
     * Gibt eine String-Repräsentation der Person zurück.
     *
     * @return Eine String-Repräsentation der Person.
     */
    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", alter=" + alter +
                '}';
    }
}

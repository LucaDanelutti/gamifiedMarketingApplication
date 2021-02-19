package it.polimi.db2.application.entities;

import javax.persistence.*;

@Entity
@Table(name = "offensive_words", schema = "marketing_application")
@NamedQuery(name = "OffensiveWord.findAll", query = "SELECT w FROM OffensiveWord w")
public class OffensiveWord {
    @Id
    private String word;

    public OffensiveWord() {
    }

    public String getWord() {
        return word;
    }
}

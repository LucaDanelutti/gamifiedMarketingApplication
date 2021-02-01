package it.polimi.db2.application.entities;

import javax.persistence.*;


@Entity
@Table(name = "questions_marketing", schema = "marketing_application")
public class Marketing_Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String question;
    private String type;

    @ManyToOne
    private Questionnaire questionnaire;


    public Marketing_Question() {
    }

    public String getQuestion() {
        return question;
    }

    public String getType() {
        return type;
    }

}

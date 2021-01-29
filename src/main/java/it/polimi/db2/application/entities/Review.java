package it.polimi.db2.application.entities;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "product_reviews", schema = "marketing_application")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String value;

    @ManyToOne()
    @JoinColumn(name = "questionnaire_id")
    private Questionnaire questionnaire;

    public Review() {
    }

    public Questionnaire getQuestionnaire() {
        return questionnaire;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void setQuestionnaire(Questionnaire questionnaire) {
        this.questionnaire = questionnaire;
    }
}

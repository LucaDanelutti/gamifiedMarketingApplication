package it.polimi.db2.application.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

@Entity
@Table(name = "questionnaires", schema = "marketing_application")
@NamedQuery(name = "Questionnaire.getQuestionnaireOfTheDay", query = "Select q from Questionnaire q where q.date = ?1")
public class Questionnaire implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    @Temporal(TemporalType.DATE)
    private Date date;


    @OneToMany(mappedBy = "questionnaire", fetch = FetchType.EAGER)
    private Collection<Review> reviews;

    @OneToMany(mappedBy= "questionnaire", fetch = FetchType.EAGER)
    private Collection<MarketingQuestion> marketingQuestions;

    public Questionnaire() {
    }

    public Collection<Review> getReviews() {
        return reviews;
    }

    public void setReviews(Collection<Review> reviews) {
        this.reviews = reviews;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Collection<MarketingQuestion> getMarketingQuestions() {
        return marketingQuestions;
    }

    public void addMarketingQuestion(MarketingQuestion q) {
        marketingQuestions.add(q);
        q.setQuestionnaire(this);
    }

    public int getId() {
        return id;
    }
}

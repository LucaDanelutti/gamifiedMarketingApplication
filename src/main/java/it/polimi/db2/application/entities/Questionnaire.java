package it.polimi.db2.application.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

@Entity
@Table(name = "questionnaires", schema = "marketing_application")
public class Questionnaire implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    @Temporal(TemporalType.DATE)
    private Date date;


    @OneToMany(mappedBy = "questionnaire")
    private Collection<Review> reviews;

    @OneToMany(mappedBy= "questionnaire")
    private Collection<Marketing_Question> marketing_questions;



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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Collection<Marketing_Question> getMarketing_questions() {
        return marketing_questions;
    }

    public void setMarketing_questions(Collection<Marketing_Question> marketing_questions) {
        this.marketing_questions = marketing_questions;
    }

    public int getId() {
        return id;
    }
}

package it.polimi.db2.application.entities;

import org.apache.commons.lang3.time.DateUtils;
import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

/**
 * This is the entity corresponding to the "questionnaires" table.
 */
@Entity
@Table(name = "questionnaires", schema = "marketing_application")
@NamedQuery(name = "Questionnaire.getQuestionnaireOfTheDay", query = "Select q from Questionnaire q where q.date = ?1 and q.isEnabled = 1")
@NamedQuery(name = "Questionnaire.getNotEnabledQuestionnaires", query = "Select q from Questionnaire q where q.isEnabled = 0 and q.date >= ?1")
@NamedQuery(name = "Questionnaire.getAllPrevious", query = "Select q from Questionnaire q where q.date < ?1")
@NamedQuery(name = "Questionnaire.getAllQuestionnaires", query = "Select q from Questionnaire q")
public class Questionnaire implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private int isEnabled;

    @Temporal(TemporalType.DATE)
    private Date date;

    @Basic(fetch = FetchType.LAZY)
    @Lob
    private byte[] image;

    @OneToMany(mappedBy = "questionnaire", fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
    private Collection<Review> reviews = new ArrayList<>();

    @OneToMany(mappedBy= "questionnaire", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    private Collection<MarketingQuestion> marketingQuestions;

    @OneToMany(mappedBy = "questionnaire", cascade = CascadeType.REMOVE)
    private Collection<StatsReply> statsReplies;

    public Questionnaire() {
    }

    // FUNCTIONALITIES

    public void addReview(Review review){
        review.setQuestionnaire(this);
        this.reviews.add(review);
    }

    public void addMarketingQuestion(MarketingQuestion q) {
        marketingQuestions.add(q);
        q.setQuestionnaire(this);
    }


    // GETTERS AND SETTERS

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

    public int getId() {
        return id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public int getIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(int isEnabled) {
        this.isEnabled = isEnabled;
    }

    public String getImageData() {
        return Base64.getMimeEncoder().encodeToString(image);
    }

    // function used for debug purposes
    public String getDateWithNoTime(){
        return DateUtils.truncate(date, Calendar.DAY_OF_MONTH).toString().substring(0,10);
    }

}

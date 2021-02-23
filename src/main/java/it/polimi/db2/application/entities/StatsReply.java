package it.polimi.db2.application.entities;

import javax.persistence.*;

class StatsReplyId {
    private int question;
    private int user;
    private int questionnaire;
    public StatsReplyId() {
    }
}

@Entity
@IdClass(StatsReplyId.class)
@Table(name = "replies_stats", schema = "marketing_application")
@NamedQuery(name = "StatsReply.findByQuestionnaireAndStatQuestion",
        query = "SELECT sr FROM StatsReply sr WHERE sr.questionnaire.id=?1 AND sr.question.id=?2")
public class StatsReply {
    @Id
    @ManyToOne
    @JoinColumn(name="question_stats_id")
    private StatsQuestion question;

    @Id
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    @Id
    @ManyToOne
    @JoinColumn(name="questionnaire_id")
    private Questionnaire questionnaire;

    private String value;

    public StatsReply() {
    }

    public StatsReply(StatsQuestion question, User user, Questionnaire questionnaire, String value) {
        this.questionnaire = questionnaire;
        this.questionnaire.addStatsReply(this);
        this.question = question;
        this.question.addReply(this);
        this.user = user;
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public User getUser() {
        return user;
    }
}

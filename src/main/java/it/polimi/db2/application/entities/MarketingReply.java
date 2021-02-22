package it.polimi.db2.application.entities;

import javax.persistence.*;

class MarketingReplyId {
    private int question;
    private int user;
    public MarketingReplyId() {
    }
}

@Entity
@IdClass(MarketingReplyId.class)
@Table(name = "replies_marketing", schema = "marketing_application")
public class MarketingReply {
    @Id
    @ManyToOne
    @JoinColumn(name="questions_marketing_id")
    private MarketingQuestion question;

    @Id
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    private String value;

    public MarketingReply() {
    }

    public MarketingReply(MarketingQuestion question, User user, String value) {
        this.question = question;
        question.addReply(this);
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

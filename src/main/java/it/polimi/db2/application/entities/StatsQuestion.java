package it.polimi.db2.application.entities;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "questions_stats", schema = "marketing_application")
@NamedQuery(name = "StatsQuestion.findAll", query = "SELECT q FROM StatsQuestion q")
public class StatsQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String question;

    @Enumerated(EnumType.STRING)
    private QuestionType type;

    @OneToMany(mappedBy = "question")
    private List<StatsReply> replies;

    public StatsQuestion() {
    }

    public String getQuestion() {
        return question;
    }

    public int getId() {
        return id;
    }

    public QuestionType getType() {
        return type;
    }

    public void addReply(StatsReply reply) {
        replies.add(reply);
    }

    public List<StatsReply> getReplies() {
        return replies;
    }
}

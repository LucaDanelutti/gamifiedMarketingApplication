package it.polimi.db2.application.entities;

import javax.persistence.*;

class ScoreId {
    private int questionnaire;
    private int user;
    public ScoreId() {
    }
}

@Entity
@IdClass(ScoreId.class)
@Table(name = "scores", schema = "marketing_application")
public class Score {
    @Id
    @ManyToOne
    @JoinColumn(name="questionnaire_id")
    private Questionnaire questionnaire;

    @Id
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    private int score;
}

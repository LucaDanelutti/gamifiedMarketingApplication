package it.polimi.db2.application.entities;

import javax.persistence.*;

@Entity
@Table(name = "stats_marketing", schema = "marketing_application")
@NamedQuery(name = "StatsQuestion.findAll", query = "SELECT q FROM StatsQuestion q")
public class StatsQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String question;

    @Enumerated(EnumType.STRING)
    private QuestionType type;

    public StatsQuestion() {
    }
}

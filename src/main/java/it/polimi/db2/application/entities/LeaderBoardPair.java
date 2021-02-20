package it.polimi.db2.application.entities;

public class LeaderBoardPair {
    private Long score;
    private User user;
    public LeaderBoardPair(User user, Long score) {
        this.score = score;
        this.user = user;
    }

    public Long getScore() {
        return score;
    }

    public User getUser() {
        return user;
    }
}

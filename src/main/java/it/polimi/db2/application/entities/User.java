package it.polimi.db2.application.entities;

import org.apache.commons.lang.time.DateUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;

/**
 * The persistent class for the usertable database table.
 */
@Entity
@Table(name = "users", schema = "marketing_application")
@NamedQuery(name = "User.checkCredentials", query = "SELECT r FROM User r  WHERE r.username = ?1 and r.password = ?2")
@NamedNativeQuery(name = "User.getUsersWhoSubmittedQuestionnaire", query =
        "SELECT u.*\n" +
                "FROM users u\n" +
                "         JOIN (SELECT DISTINCT l.user_id\n" +
                "               FROM questionnaires q\n" +
                "                        JOIN login_logs l\n" +
                "               WHERE q.date = DATE(l.timestamp)\n" +
                "                 and compilation_requested = 1\n" +
                "                 and compilation_completed = 1\n" +
                "                 and q.id = ?1) as ql\n" +
                "ON u.id = ql.user_id", resultClass = User.class)
@NamedNativeQuery(name = "User.getUsersWhoCancelledQuestionnaire", query =
        "SELECT u.*\n" +
                "FROM users u\n" +
                "         JOIN (SELECT DISTINCT l.user_id\n" +
                "               FROM questionnaires q\n" +
                "                        JOIN login_logs l\n" +
                "               WHERE q.date = DATE(l.timestamp)\n" +
                "                 and compilation_requested = 1\n" +
                "                 and compilation_completed = 0\n" +
                "                 and q.id = ?1) as ql\n" +
                "ON u.id = ql.user_id", resultClass = User.class)
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String password;
    private String email;
    private Boolean banned;

    public int getIsAdmin() {
        return isAdmin;
    }

    private int isAdmin;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private List<LoginLog> logs;

    //EMPTY
    public User() {
    }

    //METHODS
    public void addNewLog(LoginLog log) {
        logs.add(log);
    }


    //GETTER AND SETTERS
    public String getEmail() {
        return email;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getBanned() {
        return banned;
    }

    public void setBanned(Boolean banned) {
        this.banned = banned;
    }

    public List<LoginLog> getLogsOfTheDay() {
        ArrayList<LoginLog> result = new ArrayList<>();
        for (int i=logs.size()-1; i >= 0; i--) {
            if (!DateUtils.isSameDay(logs.get(i).getTimestamp(), new java.util.Date(System.currentTimeMillis()))) break;
            if (logs.get(i).getCompilation_completed()) result.add(logs.get(i));
        }
        return result;
    }

    public LoginLog getLastLog() {
        return logs.get(logs.size() - 1);
    }

    public List<LoginLog> getLogs() {
        return logs;
    }

    public void setLogs(List<LoginLog> logs) {
        this.logs = logs;
    }
}
package it.polimi.db2.application.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;


@Embeddable
class LogKey implements Serializable {
	@Column(name= "user_id")
	int id;

	@Column(name="timestamp", columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	Date timestamp;

	public LogKey(){
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
}

@Entity
@Table(name = "login_logs", schema = "marketing_application")
public class Login_Log implements Serializable {
	private static final long serialVersionUID = 1L;


	@EmbeddedId
	private LogKey logKey;

	@MapsId("id")
	@ManyToOne @JoinColumn(name= "user_id")
	private User user;


	int compilation_requested;
	int compilation_completed;



	//CONSTRUCTOR
	public Login_Log() {
	}


	//GETTERS AND SETTERS

	public LogKey getLogKey() {
		return logKey;
	}

	public void setLogKey(LogKey logKey) {
		this.logKey = logKey;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getCompilation_requested() {
		return compilation_requested;
	}

	public void setCompilation_requested(int compilation_requested) {
		this.compilation_requested = compilation_requested;
	}

	public int getCompilation_completed() {
		return compilation_completed;
	}

	public void setCompilation_completed(int compilation_completed) {
		this.compilation_completed = compilation_completed;
	}
}

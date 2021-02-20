package it.polimi.db2.application.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;


class LoginLogId {
	private int user;
	private Date timestamp;
	public LoginLogId(){
	}
}

@Entity
@IdClass(LoginLogId.class)
@Table(name = "login_logs", schema = "marketing_application")
public class LoginLog implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Date timestamp;

	@Id
	@ManyToOne
	@JoinColumn(name= "user_id")
	private User user;

	int compilation_requested;
	int compilation_completed;


	//CONSTRUCTOR

	public LoginLog() {
	}
	public LoginLog(User user, Date timestamp){
		this.user=user;
		this.timestamp=timestamp;
		this.compilation_completed=0;
		this.compilation_requested=0;
		user.addNewLog(this);
	}


	//GETTER & SETTERS

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

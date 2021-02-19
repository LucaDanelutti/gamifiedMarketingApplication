package it.polimi.db2.application.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 * The persistent class for the usertable database table.
 * 
 */
@Entity
@Table(name = "users", schema = "marketing_application")
@NamedQuery(name = "User.checkCredentials", query = "SELECT r FROM User r  WHERE r.username = ?1 and r.password = ?2")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	private String email;
	private Boolean banned;

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private List<Login_Log> logs;

	//EMPTY
	public User() {
	}

	//METHODS
	public void addNewLog(Login_Log log){
		logs.add(log);
		log.setUser(this);
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

	public List<Login_Log> getLogs() {
		return logs;
	}

	public void setLogs(List<Login_Log> logs) {
		this.logs = logs;
	}
}
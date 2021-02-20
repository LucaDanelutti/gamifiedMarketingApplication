package it.polimi.db2.application.services;

import it.polimi.db2.application.entities.LoginLog;
import it.polimi.db2.application.entities.User;
import it.polimi.db2.application.exceptions.CredentialsException;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import java.util.Date;
import java.util.List;

@Stateless
public class AdminService {
	@PersistenceContext(unitName = "MarketingApplicationEJB")
	private EntityManager em;

	public AdminService() {
	}

}

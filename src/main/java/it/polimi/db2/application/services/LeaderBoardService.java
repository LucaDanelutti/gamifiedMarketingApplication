package it.polimi.db2.application.services;

import it.polimi.db2.application.entities.LeaderBoardPair;

import javax.ejb.Stateless;
import javax.persistence.*;
import java.util.List;

@Stateless
public class LeaderBoardService {
    @PersistenceContext(unitName = "MarketingApplicationEJB")
    private EntityManager em;

    public LeaderBoardService() {
    }

    public List<LeaderBoardPair> getLeaderBoard() {
        return em.createQuery("Select NEW it.polimi.db2.application.entities.LeaderBoardPair(s.user, sum(s.score)) from Score s group by s.user order by sum(s.score) DESC").getResultList();
    }
}

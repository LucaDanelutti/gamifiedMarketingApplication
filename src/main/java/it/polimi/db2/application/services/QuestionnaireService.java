package it.polimi.db2.application.services;

import it.polimi.db2.application.entities.Marketing_Question;
import it.polimi.db2.application.entities.Questionnaire;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Stateless
public class QuestionnaireService {
    @PersistenceContext(unitName = "MarketingApplicationEJB")
    private EntityManager em;

    public QuestionnaireService() {
    }

    public Questionnaire getQuestionnaireOfTheDay() {
        List<Questionnaire> questionnaires = em.createQuery("Select q from Questionnaire q where q.date = ?1", Questionnaire.class).setParameter(1, new Date(System.currentTimeMillis())).getResultList();
        if (questionnaires.isEmpty()) return null;
        else if (questionnaires.size() == 1) return questionnaires.get(0);
        throw new NonUniqueResultException();
    }

    public ArrayList<Marketing_Question> getMarketingQuestions(Integer questionnaire_id){
        Questionnaire questionnaire=  em.find(Questionnaire.class, questionnaire_id);
        ArrayList<Marketing_Question> marketing_questions = new ArrayList<>(questionnaire.getMarketing_questions());

        if(marketing_questions.size()==0) {
            //TODO: throw exception
            return null;
        }
        return marketing_questions;
    }


}

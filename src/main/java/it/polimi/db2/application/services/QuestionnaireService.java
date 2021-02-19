package it.polimi.db2.application.services;

import it.polimi.db2.application.entities.MarketingQuestion;
import it.polimi.db2.application.entities.Questionnaire;
import it.polimi.db2.application.entities.StatsQuestion;

import javax.ejb.Stateless;
import javax.persistence.*;
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
        List<Questionnaire> questionnaires = em.createNamedQuery("Questionnaire.getQuestionnaireOfTheDay", Questionnaire.class).setParameter(1, new Date(System.currentTimeMillis())).getResultList();
        if (questionnaires.isEmpty()) return null;
        else if (questionnaires.size() == 1) return questionnaires.get(0);
        throw new NonUniqueResultException();
    }

    public ArrayList<MarketingQuestion> getMarketingQuestions(Integer questionnaire_id){
        Questionnaire questionnaire =  em.find(Questionnaire.class, questionnaire_id);
        ArrayList<MarketingQuestion> marketing_questions = new ArrayList<>(questionnaire.getMarketingQuestions());

        if(marketing_questions.size()==0) {
            //TODO: throw exception
            return null;
        }
        return marketing_questions;
    }

    public List<StatsQuestion> getStatsQuestions() {
        return em.createNamedQuery("StatsQuestion.findAll", StatsQuestion.class).getResultList();
    }

}

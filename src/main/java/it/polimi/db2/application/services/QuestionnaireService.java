package it.polimi.db2.application.services;

import it.polimi.db2.application.entities.*;

import javax.ejb.Stateless;
import javax.persistence.*;
import java.sql.Blob;
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

    public ArrayList<Questionnaire> getNotEnabledQuestionnaires(){
        List<Questionnaire> notEnabled = em.createNamedQuery("Questionnaire.getNotEnabledQuestionnaires", Questionnaire.class).setParameter(1,new Date(System.currentTimeMillis())).getResultList();
        if(notEnabled.isEmpty()) return null;
        else return new ArrayList<>(notEnabled);
    }

    public void enableQuestionnaire(int id){
        Questionnaire questionnaire = em.find(Questionnaire.class, id);
        questionnaire.setIsEnabled(1);
    }

    public void deleteQuestionnaire(int id){
        Questionnaire questionnaire = em.find(Questionnaire.class, id);
        //TODO: delete questionnaire and: questions/replies/points
    }

    public ArrayList<Questionnaire> getAllPreviousQuestionnaires(){
        List<Questionnaire> questionnaires = em.createNamedQuery("Questionnaire.getAllPrevious", Questionnaire.class).setParameter(1, new Date(System.currentTimeMillis())).getResultList();
        if(questionnaires.isEmpty()) return null;
        else return new ArrayList<>(questionnaires);
    }

    public Questionnaire findQuestionnaireById(int id){
        return em.find(Questionnaire.class,id);
    }

    public List<MarketingQuestion> getMarketingQuestions(Integer questionnaire_id){
        Questionnaire questionnaire =  em.find(Questionnaire.class, questionnaire_id);
        List<MarketingQuestion> marketingQuestions = new ArrayList<>(questionnaire.getMarketingQuestions());

        if(marketingQuestions.size()==0) {
            //TODO: throw exception
            return null;
        }
        return marketingQuestions;
    }

    public List<StatsQuestion> getStatsQuestions() {
        return em.createNamedQuery("StatsQuestion.findAll", StatsQuestion.class).getResultList();
    }

    public void addMarketingReply(String value, int questionId, User user) {
        MarketingQuestion question = em.find(MarketingQuestion.class, questionId);
        MarketingReply reply = new MarketingReply(question, user, value);
        em.persist(reply);
    }

    public void addMarketingQuestion(int questionnaireId, int type, String text){
        Questionnaire questionnaire = em.find(Questionnaire.class,questionnaireId);
        MarketingQuestion marketingQuestion = new MarketingQuestion(text, QuestionType.getQuestionTypeFromInt(type));
        questionnaire.addMarketingQuestion(marketingQuestion);
        em.persist(marketingQuestion);
    }

    public void addStatsReply(String value, int questionId, int questionnaireId, User user) {
        StatsQuestion question = em.find(StatsQuestion.class, questionId);
        Questionnaire questionnaire = em.find(Questionnaire.class, questionnaireId);
        StatsReply reply = new StatsReply(question, user, questionnaire, value);
        em.persist(reply);
    }

    public boolean checkReplies(List<String> values) {
        List<OffensiveWord> words = em.createNamedQuery("OffensiveWord.findAll", OffensiveWord.class).getResultList();
        for (String value: values) {
            for (OffensiveWord word: words) {
                if (value.toLowerCase().contains(word.getWord().toLowerCase())) return true;
            }
        }
        return false;
    }

    public void createQuestionnaire(String name, byte [] image, Date date, List<Review> reviews){
        Questionnaire questionnaire = new Questionnaire();
        questionnaire.setName(name);
        questionnaire.addReview(new Review("Test Review 1"));
        questionnaire.addReview(new Review("Test Review 2"));
        questionnaire.setDate(date);
        questionnaire.setImage(image);
        em.persist(questionnaire);
    }
}

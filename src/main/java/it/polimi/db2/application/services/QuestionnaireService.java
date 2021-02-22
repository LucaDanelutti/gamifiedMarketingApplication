package it.polimi.db2.application.services;

import it.polimi.db2.application.entities.*;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * This is the Stateless EJB for the management of questionnaires.
 */
@Stateless
public class QuestionnaireService {
    @PersistenceContext(unitName = "MarketingApplicationEJB")
    private EntityManager em;

    public QuestionnaireService() {
    }



     // ###############  GENERAL SERVICES ###############


    /**
     * @return The questionnaire of the current day
     */
    public Questionnaire getQuestionnaireOfTheDay() {
        List<Questionnaire> questionnaires = em.createNamedQuery("Questionnaire.getQuestionnaireOfTheDay", Questionnaire.class).setParameter(1, new Date(System.currentTimeMillis())).getResultList();
        if (questionnaires.isEmpty()) return null;
        else if (questionnaires.size() == 1) return questionnaires.get(0);
        throw new NonUniqueResultException();
    }

    /**
     * @return This method returns the questionnaires not already enabled
     */
    public ArrayList<Questionnaire> getNotEnabledQuestionnaires(){
        List<Questionnaire> notEnabled = em.createNamedQuery("Questionnaire.getNotEnabledQuestionnaires", Questionnaire.class).setParameter(1,new Date(System.currentTimeMillis())).getResultList();
        if(notEnabled == null) return null;
        else return new ArrayList<>(notEnabled);
    }

    /**
     *
     * @param id of the questionnaire to enable
     */
    public void enableQuestionnaire(int id){
        Questionnaire questionnaire = em.find(Questionnaire.class, id);
        questionnaire.setIsEnabled(1);
    }

    /**
     *
     * @param id of the questionnaire to delete
     */
    public void deleteQuestionnaire(int id){
        Questionnaire questionnaire = em.find(Questionnaire.class, id);
        em.remove(questionnaire);
    }

    /**
     * @return the list of previous questionnaires (with respect to the current date)
     */
    public ArrayList<Questionnaire> getAllPreviousQuestionnaires(){
        List<Questionnaire> questionnaires = em.createNamedQuery("Questionnaire.getAllPrevious", Questionnaire.class).setParameter(1, new Date(System.currentTimeMillis())).getResultList();
        if(questionnaires.isEmpty()) return null;
        else return new ArrayList<>(questionnaires);
    }

    /**
     * @param id the id of the questionnaire to be retrived
     * @return the questionnaire with the provided id
     */
    public Questionnaire findQuestionnaireById(int id){
        return em.find(Questionnaire.class,id);
    }


    /**
     * This method is used to create a new questionnaire
     * @param name the name of the questionnaire
     * @param image the image of the product of the questionnaire
     * @param date the date of the questionnaire
     * @param reviews the reviews of the questionnaire //for the moment hardcoded
     */
    public void createQuestionnaire(String name, byte [] image, Date date, List<Review> reviews){
        Questionnaire questionnaire = new Questionnaire();
        questionnaire.setName(name);
        questionnaire.addReview(new Review("Questionnaire: "+name+" - Review 1"));
        questionnaire.addReview(new Review("Questionnaire: "+name+" - Review 2"));
        questionnaire.addReview(new Review("Questionnaire: "+name+" - Review 3"));
        questionnaire.setDate(date);
        questionnaire.setImage(image);
        em.persist(questionnaire);
    }

    /**
     *
     * @return a list of all the questionnaires
     */
    public List<Questionnaire> getQuestionnaires() {
        List<Questionnaire> questionnaires = em.createNamedQuery("Questionnaire.getAllQuestionnaires", Questionnaire.class).getResultList();
        if (questionnaires.isEmpty()) return new ArrayList<>();
        else return questionnaires;
    }

    /**
     *
     * @param values the list of words to check
     * @return a boolean value: TRUE if the provided list contains an offensive word
     */
    public boolean checkReplies(List<String> values) {
        List<OffensiveWord> words = em.createNamedQuery("OffensiveWord.findAll", OffensiveWord.class).getResultList();
        for (String value: values) {
            for (OffensiveWord word: words) {
                if (value.toLowerCase().contains(word.getWord().toLowerCase())) return true;
            }
        }
        return false;
    }



     // ###############  MARKETING QUESTIONS ###############


    /**
     *
     * @param id the id of th questionnaire where to retrieve the marketing questions
     * @return an arrayList containing all the marketing questions for the questionnaire with the provided id
     */
    public List<MarketingQuestion> getQuestionnaireMarketingQuestions(String id) {
        int _id;
        try {
            _id = Integer.parseInt(id);
        } catch(NumberFormatException e) {
            return new ArrayList<>();
        }
        Questionnaire q = findQuestionnaireById(_id);
        return new ArrayList<>(q.getMarketingQuestions());
    }

    /**
     * @param questionnaire_id the id of the questionnaire
     * @return the marketing questions of the questionnaire with the provided id
     */
    public List<MarketingQuestion> getMarketingQuestions(Integer questionnaire_id){
        Questionnaire questionnaire =  em.find(Questionnaire.class, questionnaire_id);
        List<MarketingQuestion> marketingQuestions = new ArrayList<>(questionnaire.getMarketingQuestions());
        if(marketingQuestions.size()==0) return null;
        return marketingQuestions;
    }

    /**
     * @param value the value of the reply
     * @param questionId the id of the question
     * @param user the user who wrote the reply
     */
    public void addMarketingReply(String value, int questionId, User user) {
        MarketingQuestion question = em.find(MarketingQuestion.class, questionId);
        MarketingReply reply = new MarketingReply(question, user, value);
        em.persist(reply);
    }

    /**
     * @param questionnaireId the id of the questionnaire
     * @param type the type of the question from QuestionType ENUM
     * @param text the text of the question
     */
    public void addMarketingQuestion(int questionnaireId, int type, String text){
        Questionnaire questionnaire = em.find(Questionnaire.class,questionnaireId);
        MarketingQuestion marketingQuestion = new MarketingQuestion(text, QuestionType.getQuestionTypeFromInt(type));
        questionnaire.addMarketingQuestion(marketingQuestion);
        em.persist(marketingQuestion);
    }


     // ###############  STATISTICAL QUESTIONS ###############

    /**
     * @return the statistical  questions
     */
    public List<StatsQuestion> getStatsQuestions() {
        return em.createNamedQuery("StatsQuestion.findAll", StatsQuestion.class).getResultList();
    }

    /**
     *
     * @param value the value of the reply
     * @param questionId the id of the question
     * @param questionnaireId the id of the questionnaire from where the reply was created
     * @param user the user who wrote the reply
     */
    public void addStatsReply(String value, int questionId, int questionnaireId, User user) {
        StatsQuestion question = em.find(StatsQuestion.class, questionId);
        Questionnaire questionnaire = em.find(Questionnaire.class, questionnaireId);
        StatsReply reply = new StatsReply(question, user, questionnaire, value);
        em.persist(reply);
    }

    public List<List<StatsReply>> getStatsRepliesOfQuestionnaire(String questionnaireID){
        List<List<StatsReply>> statsReplies = new ArrayList<>();

        Questionnaire questionnaire=em.find(Questionnaire.class, Integer.parseInt(questionnaireID));

        List<StatsQuestion> statsQuestions = em.createNamedQuery("StatsQuestion.findAll", StatsQuestion.class).getResultList();

        for (StatsQuestion sq : statsQuestions) {
            List<StatsReply> sR= em.createNamedQuery("StatsReply.findByQuestionnaireAndStatQuestion", StatsReply.class)
                    .setParameter(1, questionnaire.getId())
                    .setParameter(2, sq.getId()).getResultList();
            statsReplies.add(sR);
        }
        return statsReplies;
    }
}

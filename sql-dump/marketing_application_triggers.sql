use marketing_application;
drop trigger new_reply_marketing;
drop trigger new_reply_stats;
drop trigger delete_scores;

DELIMITER $$

CREATE TRIGGER new_reply_marketing
AFTER INSERT ON marketing_application.replies_marketing 
FOR EACH ROW
BEGIN
	if exists(select * from marketing_application.scores where new.user_id=user_id and questionnaire_id=(select questionnaire_id from questions_marketing where id=new.questions_marketing_id) ) then
		update scores set score=score+1 where new.user_id=user_id and questionnaire_id=(select questionnaire_id from questions_marketing where id=new.questions_marketing_id);
    else
		insert into scores values ( (select questionnaire_id from questions_marketing where id=new.questions_marketing_id),new.user_id, 1);
	end if;
END$$    


CREATE TRIGGER new_reply_stats
AFTER INSERT ON marketing_application.replies_stats 
FOR EACH ROW
BEGIN
	if exists(select * from marketing_application.scores where new.user_id=user_id and questionnaire_id=new.questionnaire_id) then
		update scores set score=score+2 where new.user_id=user_id  and questionnaire_id=new.questionnaire_id;
	else
		insert into scores values ( new.questionnaire_id,new.user_id, 2);
	end if;
END$$    


CREATE TRIGGER delete_scores
before DELETE ON marketing_application.questionnaires 
FOR EACH ROW
BEGIN
	delete from scores where scores.questionnaire_id=old.id;
END$$ 

DELIMITER ;

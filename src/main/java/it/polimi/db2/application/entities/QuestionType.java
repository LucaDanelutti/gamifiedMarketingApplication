package it.polimi.db2.application.entities;

public enum QuestionType {
    BOOL(0), STRING(1), NUMBER(2), RATING(3);

    private final int value;

    QuestionType(int value) {
        this.value = value;
    }

    public static QuestionType getQuestionTypeFromInt(int value) {
        switch (value) {
            case 0:
                return QuestionType.BOOL;
            case 1:
                return QuestionType.STRING;
            case 2:
                return QuestionType.NUMBER;
            case 3:
                return QuestionType.RATING;
        }
        return null;
    }

    public int getValue() {
        return value;
    }
}

package com.liu.entity.paper;


public class TUserPaper {

  private long id;
  private long userId;
  private long paperId;
  private String answer;
  private String time;
  private String score;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getPaperId() {
    return paperId;
  }

  public void setPaperId(long paperId) {
    this.paperId = paperId;
  }


  public String getAnswer() {
    return answer;
  }

  public void setAnswer(String answer) {
    this.answer = answer;
  }


  public String getTime() {
    return time;
  }

  public void setTime(String time) {
    this.time = time;
  }


  public String getScore() {
    return score;
  }

  public void setScore(String score) {
    this.score = score;
  }

}

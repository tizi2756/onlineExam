package com.liu.entity.paper;


import java.util.Date;

public class TPaper {

  private long id;
  private String papername;
  private long courseId;
  private long gradeId;
  private String creator;
  private String questionId;
  private Date begintime;
  private Date endtime;
  private String allowtime;
  private String score;
  private String paperstate;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getPapername() {
    return papername;
  }

  public void setPapername(String papername) {
    this.papername = papername;
  }


  public long getCourseId() {
    return courseId;
  }

  public void setCourseId(long courseId) {
    this.courseId = courseId;
  }


  public long getGradeidId() {
    return gradeId;
  }

  public void setGradeidId(long gradeidId) {
    this.gradeId = gradeidId;
  }


  public String getCreator() {
    return creator;
  }

  public void setCreator(String creator) {
    this.creator = creator;
  }


  public String getQuestionId() {
    return questionId;
  }

  public void setQuestionId(String questionId) {
    this.questionId = questionId;
  }


  public Date getBegintime() {
    return begintime;
  }

  public void setBegintime(Date begintime) {
    this.begintime = begintime;
  }


  public Date getEndtime() {
    return endtime;
  }

  public void setEndtime(Date endtime) {
    this.endtime = endtime;
  }


  public String getAllowtime() {
    return allowtime;
  }

  public void setAllowtime(String allowtime) {
    this.allowtime = allowtime;
  }


  public String getScore() {
    return score;
  }

  public void setScore(String score) {
    this.score = score;
  }


  public String getPaperstate() {
    return paperstate;
  }

  public void setPaperstate(String paperstate) {
    this.paperstate = paperstate;
  }

}

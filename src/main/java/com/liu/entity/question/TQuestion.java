package com.liu.entity.question;


import java.util.Date;
import java.io.Serializable;

public class TQuestion implements Serializable {

  private long id;
  private String name;
  private String optiona;
  private String optionb;
  private String optionc;
  private String optiond;
  private String answer;
  private int typeId;
  private long points;
  private Date creat_time;
  private String creator;

  public String getAnswer() {
    return answer;
  }

  public void setAnswer(String answer) {
    this.answer = answer;
  }

  public int getTypeId() {
    return typeId;
  }

  public void setTypeId(int typeId) {
    this.typeId = typeId;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getOptiona() {
    return optiona;
  }

  public void setOptiona(String optiona) {
    this.optiona = optiona;
  }

  public String getOptionb() {
    return optionb;
  }

  public void setOptionb(String optionb) {
    this.optionb = optionb;
  }

  public String getOptionc() {
    return optionc;
  }

  public void setOptionc(String optionc) {
    this.optionc = optionc;
  }

  public String getOptiond() {
    return optiond;
  }

  public void setOptiond(String optiond) {
    this.optiond = optiond;
  }

  public long getPoints() {
    return points;
  }

  public void setPoints(long points) {
    this.points = points;
  }


  public Date getCreatTime() {
    return creat_time;
  }

  public void setCreatTime(Date creat_time) {
    this.creat_time = creat_time;
  }


  public String getCreator() {
    return creator;
  }

  public void setCreator(String creator) {
    this.creator = creator;
  }

}

package com.glowfit.model;

public class Skincare {
    private int id;
    private String skinType;
    private String routine;
    private String cleanser;
    private String moisturizer;

    public Skincare() {}

    public Skincare(int id, String skinType, String routine, String cleanser, String moisturizer) {
        this.id = id;
        this.skinType = skinType;
        this.routine = routine;
        this.cleanser = cleanser;
        this.moisturizer = moisturizer;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getSkinType() { return skinType; }
    public void setSkinType(String skinType) { this.skinType = skinType; }
    public String getRoutine() { return routine; }
    public void setRoutine(String routine) { this.routine = routine; }
    public String getCleanser() { return cleanser; }
    public void setCleanser(String cleanser) { this.cleanser = cleanser; }
    public String getMoisturizer() { return moisturizer; }
    public void setMoisturizer(String moisturizer) { this.moisturizer = moisturizer; }
}
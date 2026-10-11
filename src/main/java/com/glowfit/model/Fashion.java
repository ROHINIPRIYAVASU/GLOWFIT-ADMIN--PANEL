package com.glowfit.model;

public class Fashion {
    private int id;
    private String bodyType;
    private String occasion;
    private String recommendation;

    public Fashion() {}

    public Fashion(int id, String bodyType, String occasion, String recommendation) {
        this.id = id;
        this.bodyType = bodyType;
        this.occasion = occasion;
        this.recommendation = recommendation;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getBodyType() { return bodyType; }
    public void setBodyType(String bodyType) { this.bodyType = bodyType; }
    public String getOccasion() { return occasion; }
    public void setOccasion(String occasion) { this.occasion = occasion; }
    public String getRecommendation() { return recommendation; }
    public void setRecommendation(String recommendation) { this.recommendation = recommendation; }
}

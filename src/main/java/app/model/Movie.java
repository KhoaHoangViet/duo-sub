package app.model;

public class Movie {
  private Integer id;
  private String title;
  private String description;
  private float avg_rating;

  public Movie() {
  }

  public Movie(Integer id, String title, String description, float avg_rating) {
    this.id = id;
    this.title  = title;
    this.description = description;
    this.avg_rating = avg_rating;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public float getAvg_rating() {
    return avg_rating;
  }

  public void setAvg_rating(float avg_rating) {
    this.avg_rating = avg_rating;
  }
}

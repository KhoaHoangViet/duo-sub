package app.service.impl;

import app.dao.MovieDAO;

public class BaseServiceImpl {
  protected MovieDAO movieDAO;

  public MovieDAO getMovieDAO() {
    return movieDAO;
  }

  public void setMovieDAO(MovieDAO movieDAO) {
    this.movieDAO = movieDAO;
  }
}

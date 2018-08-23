package app.service;

import java.util.List;

import app.model.Movie;

public interface MovieService extends BaseService<Integer, Movie> {
  boolean deleteMovie(Integer id);

  Movie findByTitle(String email);

  List<Movie> loadAll();
}

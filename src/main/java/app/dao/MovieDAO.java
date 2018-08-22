package app.dao;

import java.util.List;

import app.model.Movie;

public interface MovieDAO extends BaseDAO<Integer, Movie> {

  void addMovie(Movie movie);

  List<Movie> loadAll();

  Movie findByTitle(String movieTitle);

  Movie update(Movie movie);

}

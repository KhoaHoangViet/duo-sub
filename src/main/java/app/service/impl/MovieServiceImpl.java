package app.service.impl;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;

import app.model.Movie;
import app.service.MovieService;

public class MovieServiceImpl extends BaseServiceImpl implements MovieService {
  private static final Logger logger = Logger.getLogger(MovieServiceImpl.class);

  @Override
  public Movie saveOrUpdate(Movie entity) {
    try {
      return getMovieDAO().saveOrUpdate(entity);
    } catch (Exception e) {
      logger.error(e);
      throw e;
    }
  }

  @Override
  public boolean deleteMovie(Integer id) {
    try {
      Movie student = getMovieDAO().findById(id);
      return delete(student);
    } catch (Exception e) {
      logger.error(e);
      throw e;
    }
  }

  @Override
  public Movie findByTitle(String title) {
    try {
      return getMovieDAO().findByTitle(title);
    } catch (Exception e) {
      return null;
    }
  }

  @Override
  public List<Movie> loadAll() {
    try {
      return getMovieDAO().loadAll();
    } catch (Exception e) {
      return null;
    }
  }

  @Override
  public Movie findById(Serializable key) {
    try {
      return getMovieDAO().findById(key);
    } catch (Exception e) {
      return null;
    }
  }

  @Override
  public boolean delete(Movie entity) {
    try {
      getMovieDAO().delete(entity);
      return true;
    } catch (Exception e) {
      logger.error(e);
      throw e;
    }
  }

}

package app.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import app.model.Movie;
import app.service.MovieService;

@Controller
public class MovieController {
  private static final Logger logger = Logger.getLogger(MovieController.class);

  @Autowired
  private MovieService movieService;

  @RequestMapping(value = "/")
  public ModelAndView index() {
    logger.info("home page");
    ModelAndView model = new ModelAndView("home");
    model.addObject("movie", new Movie());
    model.addObject("movies", movieService.loadAll());
    return model;
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public String show(@PathVariable("id") int id, Model model) {
    logger.info("detail movie");
    Movie movie = movieService.findById(id);
    if (movie == null) {
      model.addAttribute("css", "danger");
      model.addAttribute("msg", "Movie not found");
    }
    model.addAttribute("movie", movie);
    return "home";
  }
}

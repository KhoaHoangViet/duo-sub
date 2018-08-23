<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty msg}">
  <div class="alert alert-${css} alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
    <strong>${msg}</strong>
  </div>
</c:if>

<c:if test="${empty msg}">
  <fieldset>
    <legend>
      <h2>Movie List</h2>
    </legend>
  <table class="table table-hover table-dark">
    <thead class="bg-primary">
      <tr>
        <th scope="col">#</th>
        <th scope="col">Title</th>
        <th scope="col">Description</th>
        <th scope="col">Rating</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${movies}" var="movie" varStatus="count">
        <tr>
          <th scope="row">${count.index + 1}</th>
          <td>${movie.title}</td>
          <td>${movie.description}</td>
          <td>${movie.avg_rating}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</c:if>

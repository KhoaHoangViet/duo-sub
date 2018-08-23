<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<spring:url value="/" var="urlHome" />

<nav class="navbar navbar-inverse ">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="${urlHome}">DualSub</a>
      <form class="navbar-form navbar-left">
        <div class="input-group input-group-sm">
          <input placeholder="Search for videos..." type="text" class="form-control" name="key">
          <span class="input-group-btn">
            <button class="btn btn-danger" type="submit">
            <i class="fa fa-search"></i></button>
          </span>
        </div>
      </form>
    </div>
  </div>
</nav>

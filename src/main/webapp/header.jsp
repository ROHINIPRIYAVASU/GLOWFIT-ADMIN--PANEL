<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <title>${pageTitle} - Glow Fit</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<aside class="sidebar">
  <div class="logo"><div class="logo-name">&#10024; Glow Fit</div><div class="logo-sub">Admin Panel</div></div>
  <div class="nav-section">Menu</div>
  <a href="${pageContext.request.contextPath}/dashboard" class="nav-item ${currentPage == 'dashboard' ? 'active' : ''}"><span class="nav-icon">&#9783;</span> Dashboard</a>
  <a href="${pageContext.request.contextPath}/fashion" class="nav-item ${currentPage == 'fashion' ? 'active' : ''}"><span class="nav-icon">&#128780;</span> Fashion</a>
  <a href="${pageContext.request.contextPath}/skincare" class="nav-item ${currentPage == 'skincare' ? 'active' : ''}"><span class="nav-icon">&#127774;</span> Skincare</a>
  <div class="sidebar-footer">Glow Fit v1.0</div>
</aside>
<div class="main">
  <div class="topbar"><span class="topbar-title"></span><div class="topbar-right"><div class="avatar">GF</div></div></div>
  <div class="content">
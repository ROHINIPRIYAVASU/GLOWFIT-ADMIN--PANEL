<%@ page import="com.glowfit.dao.FashionDAO, com.glowfit.dao.SkincareDAO" %>
<% pageContext.setAttribute("pageTitle", "Dashboard"); pageContext.setAttribute("currentPage", "dashboard");
   int fashionCount = new FashionDAO().getCount();
   int skincareCount = new SkincareDAO().getCount();
   int totalCount = fashionCount + skincareCount; %>
<%@ include file="header.jsp" %>
<div class="page-header"><div><div class="page-title">Dashboard</div><div class="page-subtitle">Overview of all records</div></div></div>
<div class="stat-grid">
  <div class="stat-card"><div class="stat-icon">&#128780;</div><div class="stat-label">Fashion Records</div><div class="stat-value"><%= fashionCount %></div><span class="stat-badge">Fashion</span></div>
  <div class="stat-card teal"><div class="stat-icon">&#127774;</div><div class="stat-label">Skincare Records</div><div class="stat-value"><%= skincareCount %></div><span class="stat-badge">Skincare</span></div>
  <div class="stat-card gray"><div class="stat-icon">&#128202;</div><div class="stat-label">Total Records</div><div class="stat-value"><%= totalCount %></div><span class="stat-badge">All</span></div>
</div>
<div class="panel">
  <div class="panel-header"><span class="panel-title">Quick Links</span></div>
  <div class="panel-body" style="display:flex;gap:10px;flex-wrap:wrap;">
    <a href="${pageContext.request.contextPath}/fashion" class="btn btn-primary">&#43; Add Fashion Record</a>
    <a href="${pageContext.request.contextPath}/skincare" class="btn">&#43; Add Skincare Record</a>
  </div>
</div>
<%@ include file="footer.jsp" %>
<%@ page import="com.glowfit.model.Skincare, com.glowfit.dao.SkincareDAO, java.util.List" %>
<% pageContext.setAttribute("pageTitle", "Skincare"); pageContext.setAttribute("currentPage", "skincare");
   List<Skincare> skincareList = (List<Skincare>) request.getAttribute("skincareList");
   String search = (String) request.getAttribute("search"); %>
<%@ include file="header.jsp" %>
<div class="page-header"><div><div class="page-title">Skincare Records</div><div class="page-subtitle">Manage skincare routines by skin type</div></div></div>
<div class="panel" style="margin-bottom:24px;">
  <div class="panel-header"><span class="panel-title">&#43; Add New Skincare Record</span></div>
  <div class="panel-body">
    <form method="post" action="${pageContext.request.contextPath}/skincare">
      <input type="hidden" name="action" value="add"/>
      <div class="form-grid">
        <div class="form-group">
          <label>Skin Type *</label>
          <select name="skinType" required>
            <option value="">Select skin type</option>
            <option value="Oily">Oily</option>
            <option value="Dry">Dry</option>
            <option value="Combination">Combination</option>
            <option value="Normal">Normal</option>
            <option value="Sensitive">Sensitive</option>
          </select>
        </div>
        <div class="form-group">
          <label>Routine *</label>
          <input type="text" name="routine" placeholder="e.g. Morning, Evening" required/>
        </div>
        <div class="form-group">
          <label>Cleanser</label>
          <input type="text" name="cleanser" placeholder="e.g. Foam Cleanser"/>
        </div>
        <div class="form-group">
          <label>Moisturizer</label>
          <input type="text" name="moisturizer" placeholder="e.g. Gel Moisturizer"/>
        </div>
      </div>
      <div class="form-actions">
        <button type="submit" class="btn btn-primary">Save Record</button>
        <button type="reset" class="btn">Clear</button>
      </div>
    </form>
  </div>
</div>
<div class="panel">
  <div class="panel-header">
    <span class="panel-title">All Records</span>
    <form method="get" action="${pageContext.request.contextPath}/skincare" class="search-bar">
      <input type="text" name="search" value="<%= search != null ? search : "" %>" placeholder="Search by skin type..."/>
      <button type="submit" class="btn btn-primary btn-sm">Search</button>
      <% if (search != null && !search.isEmpty()) { %><a href="${pageContext.request.contextPath}/skincare" class="btn btn-sm">Clear</a><% } %>
    </form>
  </div>
  <div class="panel-body" style="padding:0;">
    <% if (skincareList == null || skincareList.isEmpty()) { %>
      <div class="empty-state"><div class="empty-state-icon">&#127774;</div><div class="empty-state-text">No skincare records found</div><div class="empty-state-sub">Add your first record using the form above</div></div>
    <% } else { %>
    <div class="table-wrap"><table>
      <thead><tr><th>#</th><th>Skin Type</th><th>Routine</th><th>Cleanser</th><th>Moisturizer</th><th>Action</th></tr></thead>
      <tbody>
        <% for (Skincare s : skincareList) { %>
        <tr>
          <td><%= s.getId() %></td>
          <td><span class="badge badge-teal"><%= s.getSkinType() %></span></td>
          <td><%= s.getRoutine() %></td>
          <td><%= s.getCleanser() != null ? s.getCleanser() : "-" %></td>
          <td><%= s.getMoisturizer() != null ? s.getMoisturizer() : "-" %></td>
          <td>
            <form method="post" action="${pageContext.request.contextPath}/skincare" style="display:inline;">
              <input type="hidden" name="action" value="delete"/>
              <input type="hidden" name="id" value="<%= s.getId() %>"/>
              <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Delete this record?')">Delete</button>
            </form>
          </td>
        </tr>
        <% } %>
      </tbody>
    </table></div>
    <% } %>
  </div>
</div>
<%@ include file="footer.jsp" %>
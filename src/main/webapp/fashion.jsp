<%@ page import="com.glowfit.model.Fashion, java.util.List" %>
<%
  pageContext.setAttribute("pageTitle", "Fashion");
  pageContext.setAttribute("currentPage", "fashion");
  List<Fashion> fashionList = (List<Fashion>) request.getAttribute("fashionList");
  String search = (String) request.getAttribute("search");
%>
<%@ include file="header.jsp" %>
<div class="page-header">
  <div>
    <div class="page-title">Fashion Records</div>
    <div class="page-subtitle">Manage fashion recommendations by body type</div>
  </div>
</div>
<div class="panel" style="margin-bottom:24px;">
  <div class="panel-header"><span class="panel-title">&#43; Add New Fashion Record</span></div>
  <div class="panel-body">
    <form method="post" action="${pageContext.request.contextPath}/fashion">
      <input type="hidden" name="action" value="add"/>
      <div class="form-grid">
        <div class="form-group">
          <label for="bodyType">Body Type *</label>
          <select name="bodyType" id="bodyType" required>
            <option value="">Select body type</option>
            <option value="Hourglass">Hourglass</option>
            <option value="Pear">Pear</option>
            <option value="Apple">Apple</option>
            <option value="Rectangle">Rectangle</option>
            <option value="Inverted Triangle">Inverted Triangle</option>
          </select>
        </div>
        <div class="form-group">
          <label for="occasion">Occasion *</label>
          <input type="text" name="occasion" id="occasion" placeholder="e.g. Casual, Formal, Party" required/>
        </div>
        <div class="form-group full">
          <label for="recommendation">Recommendation *</label>
          <textarea name="recommendation" id="recommendation" placeholder="Describe the fashion recommendation..." required></textarea>
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
    <form method="get" action="${pageContext.request.contextPath}/fashion" class="search-bar">
      <input type="text" name="search" value="<%= search != null ? search : "" %>" placeholder="Search by body type..."/>
      <button type="submit" class="btn btn-primary btn-sm">Search</button>
    </form>
  </div>
  <div class="panel-body" style="padding:0;">
    <% if (fashionList == null || fashionList.isEmpty()) { %>
      <div class="empty-state">
        <div class="empty-state-icon">&#128780;</div>
        <div class="empty-state-text">No fashion records found</div>
        <div class="empty-state-sub">Add your first record using the form above</div>
      </div>
    <% } else { %>
    <div class="table-wrap">
      <table>
        <thead><tr><th>#</th><th>Body Type</th><th>Occasion</th><th>Recommendation</th><th>Action</th></tr></thead>
        <tbody>
          <% for (Fashion f : fashionList) { %>
          <tr>
            <td><%= f.getId() %></td>
            <td><span class="badge badge-gold"><%= f.getBodyType() %></span></td>
            <td><%= f.getOccasion() %></td>
            <td><%= f.getRecommendation() %></td>
            <td>
              <form method="post" action="${pageContext.request.contextPath}/fashion" style="display:inline;">
                <input type="hidden" name="action" value="delete"/>
                <input type="hidden" name="id" value="<%= f.getId() %>"/>
                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Delete this record?')">Delete</button>
              </form>
            </td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
    <% } %>
  </div>
</div>
<%@ include file="footer.jsp" %>

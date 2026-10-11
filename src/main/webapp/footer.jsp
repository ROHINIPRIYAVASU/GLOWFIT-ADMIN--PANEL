  </div>
</div>
<% String toast = (String) session.getAttribute("toast"); String toastError = (String) session.getAttribute("toastError"); if (toast != null) session.removeAttribute("toast"); if (toastError != null) session.removeAttribute("toastError"); %>
<% if (toast != null) { %><div class="toast success" id="toast"><%= toast %></div><% } %>
<% if (toastError != null) { %><div class="toast error" id="toast"><%= toastError %></div><% } %>
<script>setTimeout(function(){ var t=document.getElementById('toast'); if(t) t.style.display='none'; },3000);</script>
</body>
</html>
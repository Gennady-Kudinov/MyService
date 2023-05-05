document.getElementById("delete-all-button").addEventListener("click", function(event) {
    event.preventDefault();
    if (confirm("Подтверждаете удаление всех клиентов?")) {
      var form = document.createElement("form");
      form.setAttribute("method", "post");
      form.setAttribute("action", "<%= clients_path %>");
      form.innerHTML = "<input type='hidden' name='_method' value='delete'>" +
                       "<input type='hidden' name='authenticity_token' value='<%= form_authenticity_token %>'>";
      document.body.appendChild(form);
      form.submit();
    }
  });
  
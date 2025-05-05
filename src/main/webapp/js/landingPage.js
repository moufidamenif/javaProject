
function showForm(page) {
    document.getElementById("login_button").style.opacity ="40%"
    document.getElementById("register_button").style.opacity ="40%"
    if (page==="login.jsp") {
        document.getElementById("login_button").style.backgroundColor ="#49BBBD"
        document.getElementById("register_button").style.opacity ="100%"
    } else {
        document.getElementById("register_button").style.backgroundColor ="#49BBBD"
        document.getElementById("login_button").style.opacity ="100%"
    }
    fetch(page)
        .then(response => response.text())
        .then(html => {
            document.getElementById("formContainer").innerHTML = html;
        })
      .catch(error => {
    console.error("Error loading form:", error);
});}

<!-- Full HTML Snippet for Animation + Login + Redirect -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blood Donation Login</title>
<style>
  body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: Arial, sans-serif;
  }
  /* Fullscreen animation */
  #animation {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: #181818;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 2rem;
    z-index: 9999;
  }
  /* Fullscreen login */
  #login-section {
    display: none;
    position: fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:#181818;
    color:white;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    z-index:9998;
    padding:1rem;
    box-sizing:border-box;
  }
  #login-section h1 {
    color: #ff4d4d;
    text-align:center;
    margin-bottom:2rem;
  }
  #login-section .buttons {
    display:flex;
    justify-content:center;
    flex-wrap:wrap;
    gap:1rem;
    margin-bottom:2rem;
  }
  #login-section button.role-btn {
    padding:1rem 2rem;
    border:none;
    border-radius:10px;
    background:#b30000;
    color:white;
    cursor:pointer;
    font-size:1rem;
  }
  #loginForm {
    display:none;
    flex-direction:column;
    gap:1rem;
    width:100%;
    max-width:400px;
    text-align:center;
  }
  #loginForm input {
    padding:0.75rem 1rem;
    border-radius:8px;
    border:1px solid #ccc;
    font-size:1rem;
    width:100%;
  }
  #loginForm button {
    padding:0.75rem;
    border:none;
    border-radius:8px;
    background:#b30000;
    color:white;
    font-size:1rem;
    cursor:pointer;
    width:100%;
  }
  #loginMessage {
    margin-top:1rem;
    font-size:1rem;
  }
</style>
</head>
<body>

<!-- Animation Section -->
<div id="animation">Welcome to Blood Donation Portal...</div>

<!-- Login Section -->
<section id="login-section">
  <h1>Blood Donation Login</h1>

  <div class="buttons">
    <button class="role-btn" onclick="showForm('Blood Donor')">🩸 Blood Donor</button>
    <button class="role-btn" onclick="showForm('Volunteer Donor')">🤝 Volunteer Donor</button>
    <button class="role-btn" onclick="showForm('Blood Recipient')">❤️ Blood Recipient</button>
  </div>

  <form id="loginForm">
    <h3 id="roleTitle">Role:</h3>
    <input type="text" id="username" placeholder="Username" required>
    <input type="password" id="password" placeholder="Password" required>
    <button type="button" onclick="loginUser()">Login</button>
  </form>

  <p id="loginMessage"></p>
</section>

<script>
  // Show login after animation (3 seconds)
  window.addEventListener('load', () => {
    setTimeout(() => {
      document.getElementById('animation').style.display = 'none';
      document.getElementById('login-section').style.display = 'flex';
    }, 3000); // adjust to match your animation duration
  });

  let selectedRole = '';

  function showForm(role) {
    selectedRole = role;
    document.getElementById('loginForm').style.display = 'flex';
    document.getElementById('roleTitle').textContent = 'Role: ' + role;
    document.getElementById('loginMessage').textContent = '';
  }

  function loginUser() {
    const user = document.getElementById('username').value.trim();
    const pass = document.getElementById('password').value.trim();
    const msg = document.getElementById('loginMessage');

    // Simple login check (replace with your logic)
    if (
      (selectedRole === 'Blood Donor' && user === 'donor' && pass === '1234') ||
      (selectedRole === 'Volunteer Donor' && user === 'volunteer' && pass === '1234') ||
      (selectedRole === 'Blood Recipient' && user === 'recipient' && pass === '1234')
    ) {
      msg.style.color = 'lightgreen';
      msg.textContent = `✅ Login successful as ${selectedRole}! Redirecting...`;
      
      // Redirect to main page after 1.5 seconds
      setTimeout(() => {
        window.location.href = 'main.html'; // replace with your main page
      }, 1500);
      
    } else {
      msg.style.color = 'red';
      msg.textContent = '❌ Invalid username or password.';
    }
  }
</script>

</body>
</html>

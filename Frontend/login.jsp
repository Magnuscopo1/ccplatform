<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Amazon Premium | Corporate Portal</title>
    <!-- Your premium style.css link -->
    <link rel="stylesheet" href="style.css">
    
    <style>
        /* 1. RESET ALL MARGINS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

       
        #bg-video {
            position: fixed;   /* Sticks to the browser window */
            right: 0;
            bottom: 0;
            min-width: 100%;   /* Forces full width */
            min-height: 100%;  /* Forces full height */
            width: auto;
            height: auto;
            z-index: -100;      /* Pushes video behind everything */
            object-fit: cover;  /* Prevents stretching - covers entire area */
            filter: brightness(100%); /* Luxury Dark effect to make form pop */
        }

        /* 3. THE OVERLAY CONTAINER (Centers the login form) */
        .overlay-container {
            height: 100vh;
            width: 100%;
            display: flex;
            align-items: center;      /* Vertically center */
            justify-content: center;   /* Horizontally center */
            position: relative;
            z-index: 1;                /* Sits on top of video */
        }

        /* 4. PREMIUM GLASS LOGIN CARD */
        .login-card {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent */
            backdrop-filter: blur(15px);          /* High-end glass effect */
            padding: 50px;
            border-radius: 20px;
            width: 420px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.6);
            border: 1px solid rgba(255, 255, 255, 0.2);
            text-align: center;
        }

        .login-card h1 {
            font-size: 32px;
            margin-bottom: 10px;
            color: #131921;
        }

        .login-card h2 {
            font-weight: 300;
            color: #444;
            margin-bottom: 30px;
        }

        /* Input Styling */
        input {
            width: 100%;
            padding: 14px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }

        /* Gold Premium Button */
        .btn-premium {
            background: linear-gradient(to bottom, #f7dfa1, #f0c14b);
            border: 1px solid #a88734;
            padding: 15px;
            width: 100%;
            border-radius: 10px;
            font-weight: bold;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-premium:hover {
            background: #f3a847;
            transform: scale(1.02);
        }
    </style>
</head>
<body style="overflow: hidden;"> <!-- Prevents browser scrolling -->

    <!-- BACKGROUND VIDEO: Modern MNC Glass Office Building -->
    <video autoplay muted loop playsinline id="bg-video">
        <!-- New CDN link of high-end MNC Workspace -->
        <source src="images/office.mp4" type="video/mp4">
      
    </video>

    <!-- THE OVERLAY LAYERS -->
    <div class="overlay-container">
        <div class="login-card">
            <h1>
                <span style="color:#f3a847">Amazon</span>Premium
            </h1>
            <h1 style="color:#ffff">Sign-In</h1>

            <%-- Error display --%>
            <% if(request.getParameter("error") != null) { %>
                <p style="color:red; font-size:14px; margin-bottom:10px;">Access Denied. Check credentials.</p>
            <% } %>

            <form action="login" method="post">
                <div style="text-align: left;">
                    <label style="font-size: 13px; font-weight: bold; color: #666;">Corporate Email</label>
                    <input type="email" name="email" placeholder="name@mnc.com" required>
                    
                    <label style="font-size: 13px; font-weight: bold; color: #666;">Security Password</label>
                    <input type="password" name="password" placeholder="••••••••" required>
                </div>

                <button type="submit" class="btn-premium">Log in</button>
            </form>

            <p style="margin-top: 25px; font-size: 14px; color: #555;">
                New employee? <a href="sigup.jsp" style="color: #0066c0; text-decoration: none; font-weight: 600;">Request account</a>
            </p>
        </div>
    </div>

</body>
</html>
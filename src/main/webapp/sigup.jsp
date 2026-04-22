<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Amazon Premium | Join the MNC Elite</title>
    <!-- Your premium style.css link -->
    <link rel="stylesheet" href="style.css">
    
    <style>
        /* 1. RESET ALL MARGINS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* 2. THE VIDEO ENGINE (Identical to Login) */
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
            filter: brightness(100%); /* Matches your Login setting */
        }

        /* 3. THE OVERLAY CONTAINER (Centers the signup form) */
        .overlay-container {
            height: 100vh;
            width: 100%;
            display: flex;
            align-items: center;      /* Vertically center */
            justify-content: center;   /* Horizontally center */
            position: relative;
            z-index: 1;                /* Sits on top of video */
        }

        /* 4. PREMIUM GLASS SIGN-UP CARD */
        .auth-card {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
            backdrop-filter: blur(15px);          /* High-end glass effect */
            padding: 40px 50px;
            border-radius: 20px;
            width: 450px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.6);
            border: 1px solid rgba(255, 255, 255, 0.2);
            text-align: center;
        }

        .auth-card h1 {
            font-size: 32px;
            margin-bottom: 10px;
            color: #131921;
        }

        .auth-card h2 {
            font-weight: 300;
            color: #444;
            margin-bottom: 25px;
            font-size: 24px;
        }

        /* Input Styling */
        label {
            display: block;
            text-align: left;
            font-size: 13px;
            font-weight: bold;
            color: #666;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
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
            margin-top: 10px;
        }

        .btn-premium:hover {
            background: #f3a847;
            transform: scale(1.02);
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .link-text {
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }

        .link-text a {
            color: #0066c0;
            text-decoration: none;
            font-weight: 600;
        }
    </style>
</head>
<body style="overflow: hidden;"> 

    <!-- BACKGROUND VIDEO: Using your local office2.mp4 -->
    <video autoplay muted loop playsinline id="bg-video">
        <source src="images/office2.mp4" type="video/mp4">
   
    </video>

    <!-- THE OVERLAY LAYERS -->
    <div class="overlay-container">
        <div class="auth-card">
            <h1>
                <span style="color:#f3a847">Amazon</span>Premium
            </h1>
            <h2>Create Account</h2>

            <!-- SIGN UP FORM -->
            <form action="signup" method="post">
                <label>Your Name</label>
                <input type="text" name="name" placeholder="First and last name" required>
                
                <label>Corporate Email</label>
                <input type="email" name="email" placeholder="name@mnc.com" required>
                
                <label>Security Password</label>
                <input type="password" name="password" placeholder="At least 6 characters" minlength="6" required>
                
                <button type="submit" class="btn-premium">Create Account</button>
            </form>

            <div class="link-text">
                Already have an account? <a href="login.jsp">Sign-In</a>
            </div>
        </div>
    </div>

</body>
</html>
<%@page import="com.common.model.*,com.backend.dao.*"%>
<%
    // AUTH WALL: Mastermind security check
    User uSuccess = (User) session.getAttribute("user");
    if(uSuccess == null) { response.sendRedirect("login.jsp"); return; }

    // Fetch product details for the elite receipt
    String pidSuccess = request.getParameter("id");
    if(pidSuccess == null) { response.sendRedirect("index.jsp"); return; }

    int productId = Integer.parseInt(pidSuccess);
    Product p = new ProductDAO().getProductById(productId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful | Amazon Premium Elite</title>
    <!-- Premium Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            /* Mastermind Light Green Palette */
            --grass-green: #4ade80;        /* Vibrant Light Green */
            --neon-mint: #22d3ee;          /* Sky Blue-Green hint */
            --sky-green-bg: #f0fdf4;       /* Pleasant Sky Green Background */
            --glass-border: rgba(255, 255, 255, 0.6);
            --amazon-dark: #131921;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            /* Pleasant decent sky green gradient */
            background: radial-gradient(circle at center, var(--sky-green-bg) 0%, #dcfce7 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            overflow: hidden;
        }

        /* --- Mastermind Background Glow --- */
        .neon-glow {
            position: absolute;
            width: 500px;
            height: 500px;
            background: var(--grass-green);
            filter: blur(150px);
            opacity: 0.2;
            z-index: -1;
            animation: float 6s infinite alternate;
        }

        @keyframes float {
            from { transform: translate(-10%, -10%); }
            to { transform: translate(10%, 10%); }
        }

        /* --- Success Modal (Glassmorphism) --- */
        .success-card {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(25px);
            -webkit-backdrop-filter: blur(25px);
            width: 90%;
            max-width: 440px;
            border-radius: 40px;
            padding: 50px 40px;
            text-align: center;
            box-shadow: 0 40px 100px rgba(0, 0, 0, 0.08);
            border: 1px solid var(--glass-border);
            opacity: 0;
            transform: scale(0.9) translateY(20px);
            animation: modalIn 0.7s cubic-bezier(0.2, 1, 0.3, 1) forwards;
        }

        @keyframes modalIn {
            to { opacity: 1; transform: scale(1) translateY(0); }
        }

        /* --- Animated Light Green Checkmark --- */
        .checkmark-wrapper {
            width: 110px;
            height: 110px;
            background: linear-gradient(135deg, var(--grass-green), #86efac);
            border-radius: 50%;
            margin: 0 auto 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 15px 40px rgba(74, 222, 128, 0.4);
            position: relative;
        }

        .checkmark-svg {
            width: 55px;
            height: 55px;
            fill: none;
            stroke: white;
            stroke-width: 6;
            stroke-linecap: round;
            stroke-linejoin: round;
            stroke-dasharray: 100;
            stroke-dashoffset: 100;
            animation: drawCheck 1s 0.6s ease-out forwards;
        }

        @keyframes drawCheck {
            to { stroke-dashoffset: 0; }
        }

        /* --- Text Styling --- */
        .title {
            font-size: 26px;
            font-weight: 700;
            color: #064e3b; /* Deep Pleasant Green Text */
            margin: 0;
        }

        .subtitle {
            font-size: 15px;
            color: #374151;
            margin-top: 8px;
            opacity: 0.8;
        }

        /* --- Premium Receipt Layout --- */
        .elite-receipt {
            background: rgba(255, 255, 255, 0.5);
            margin: 30px 0;
            padding: 25px;
            border-radius: 24px;
            border: 1px solid rgba(0, 0, 0, 0.03);
            text-align: left;
        }

        .receipt-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .receipt-label { color: #6b7280; font-weight: 400; }
        .receipt-value { color: #111827; font-weight: 600; }

        .price-highlight {
            font-size: 24px;
            font-weight: 700;
            color: #b91c1c; /* Classy Red for contrast */
        }

        /* --- Mastermind CTA Button --- */
        .btn-continue {
            display: block;
            width: 100%;
            background: var(--amazon-dark);
            color: white;
            text-decoration: none;
            padding: 18px;
            border-radius: 18px;
            font-weight: 700;
            font-size: 14px;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .btn-continue:hover {
            background: #232f3e;
            transform: translateY(-2px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }

        /* --- Grass Green Confetti --- */
        .confetti {
            position: absolute;
            width: 8px; height: 8px;
            opacity: 0;
            animation: confettiRain 4s linear forwards;
        }

        @keyframes confettiRain {
            0% { transform: translateY(-10vh) rotate(0deg); opacity: 1; }
            100% { transform: translateY(100vh) rotate(720deg); opacity: 0; }
        }
    </style>
</head>
<body>

    <div class="neon-glow"></div>
    <div id="confetti-launcher"></div>

    <div class="success-card">
        <!-- Animated Grass Green Circle -->
        <div class="checkmark-wrapper">
            <svg class="checkmark-svg" viewBox="0 0 52 52">
                <path d="M14 27l7.5 7.5L38 18"></path>
            </svg>
        </div>

        <h1 class="title">Transaction Successful</h1>
        <p class="subtitle">Your order has been received and is being processed.</p>

        <!-- Premium Receipt Section -->
        <div class="elite-receipt">
            <div class="receipt-row">
                <span class="receipt-label">Order Reference</span>
                <span class="receipt-value">#AP-<%= (int)(Math.random()*899999 + 100000) %></span>
            </div>
            <div class="receipt-row">
                <span class="receipt-label">Elite Item</span>
                <span class="receipt-value"><%= p.getName() %></span>
            </div>
            <div class="receipt-row">
                <span class="receipt-label">Network Status</span>
                <span class="receipt-value" style="color:var(--grass-green)">● Secure Cloud Verified</span>
            </div>
            <hr style="border: 0; border-top: 1px solid rgba(0,0,0,0.05); margin: 15px 0;">
            <div class="receipt-row" style="align-items: center;">
                <span class="receipt-label">Amount Paid</span>
                <span class="price-highlight">$<%= p.getPrice() %></span>
            </div>
        </div>

        <a href="index.jsp" class="btn-continue">CONTINUE SHOPPING</a>
        
        <p style="margin-top: 25px; font-size: 10px; color: #9ca3af; letter-spacing: 1.5px; text-transform: uppercase;">
            Verified Payment Gate: <%= uSuccess.getName() %>
        </p>
    </div>

    <script>
        // MASTERMIND LIGHT GREEN CONFETTI
        function createConfetti() {
            const container = document.getElementById('confetti-launcher');
            const colors = ['#4ade80', '#bbf7d0', '#22d3ee', '#ffffff', '#facc15'];
            
            for (let i = 0; i < 70; i++) {
                const confetti = document.createElement('div');
                confetti.className = 'confetti';
                confetti.style.left = Math.random() * 100 + 'vw';
                confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                confetti.style.top = '-10px';
                confetti.style.animationDelay = (Math.random() * 3) + 's';
                confetti.style.width = (Math.random() * 10 + 4) + 'px';
                confetti.style.height = confetti.style.width;
                container.appendChild(confetti);
            }
        }

        window.onload = () => {
            createConfetti();
            // Clear local cart items upon success
            localStorage.removeItem('premium_cart');
        };
    </script>
</body>
</html>
<%@page import="com.common.model.*,com.backend.dao.*"%>
<%
    // AUTH WALL: Redirect if not logged in
    User uAuth = (User) session.getAttribute("user");
    if(uAuth == null) { response.sendRedirect("login.jsp"); return; }

    // Get product being purchased
    String pidStr = request.getParameter("id");
    if(pidStr == null) { response.sendRedirect("index.jsp"); return; }
    
    int productId = Integer.parseInt(pidStr);
    Product p = new ProductDAO().getProductById(productId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Secure Checkout | Amazon Premium</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .checkout-body { background: #f3f3f3; display: flex; justify-content: center; align-items: center; min-height: 100vh; padding: 20px; }
        .payment-card { background: white; width: 100%; max-width: 480px; padding: 40px; border-radius: 12px; box-shadow: 0 10px 40px rgba(0,0,0,0.1); border-top: 5px solid #febd69; }
        .payment-card h2 { text-align: center; margin-bottom: 25px; color: #131921; font-weight: 700; }
        .order-preview { display: flex; justify-content: space-between; background: #f9f9f9; padding: 15px; border-radius: 8px; margin-bottom: 25px; border: 1px dashed #ccc; }
        .payment-form label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 8px; color: #555; }
        .payment-form input { width: 100%; padding: 12px; margin-bottom: 20px; border: 1px solid #ddd; border-radius: 6px; font-size: 15px; outline: none; transition: 0.3s; }
        .payment-form input:focus { border-color: #f3a847; box-shadow: 0 0 5px rgba(243,168,71,0.3); }
        .secure-footer { text-align: center; font-size: 11px; color: #888; margin-top: 20px; }
    </style>
</head>
<body class="checkout-body">

    <div class="payment-card">
        <h2>Secure Payment</h2>

        <div class="order-preview">
            <span>Item: <b><%= p.getName() %></b></span>
            <span style="color: #B12704; font-weight: bold;">$<%= p.getPrice() %></span>
        </div>

        <!-- Redirects to success.jsp on submission -->
        <form class="payment-form" action="success.jsp" method="get">
            <!-- Hidden field to pass product ID to success page -->
            <input type="hidden" name="id" value="<%= p.getId() %>">

            <label>Cardholder Name</label>
            <input type="text" value="<%= uAuth.getName() %>" placeholder="Name on card" required>

            <label>Card Number</label>
            <input type="text" id="cardNumber" placeholder="xxxx xxxx xxxx xxxx" maxlength="19" required>

            <div style="display: flex; gap: 15px;">
                <div style="flex: 2;">
                    <label>Expiration (MM/YY)</label>
                    <input type="text" placeholder="12/26" maxlength="5" required>
                </div>
                <div style="flex: 1;">
                    <label>CVV</label>
                    <input type="password" placeholder="***" maxlength="3" required>
                </div>
            </div>

            <button type="submit" class="btn-premium" style="width: 100%; height: 55px; font-size: 18px;">
                Confirm & Pay $<%= p.getPrice() %>
            </button>
        </form>

        <p class="secure-footer">
            🔒 SSL Encrypted Checkout. Your payment information is safe.
        </p>
    </div>

    <script>
        // Formats card number as xxxx xxxx xxxx xxxx
        document.getElementById('cardNumber').addEventListener('input', function (e) {
            e.target.value = e.target.value.replace(/[^\d]/g, '').replace(/(.{4})/g, '$1 ').trim();
        });
    </script>
</body>
</html>
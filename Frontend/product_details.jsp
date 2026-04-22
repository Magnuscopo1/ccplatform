<%@page import="com.common.model.*,com.backend.dao.*"%>
<%
    User u = (User) session.getAttribute("user");
    if(u == null) { response.sendRedirect("login.jsp"); return; }

    // Get product ID from the URL
    String idParam = request.getParameter("id");
    if(idParam == null) { response.sendRedirect("index.jsp"); return; }
    
    int productId = Integer.parseInt(idParam);
    ProductDAO dao = new ProductDAO();
    Product p = dao.getProductById(productId);
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= p.getName() %> | Details</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .details-wrapper { max-width: 1100px; margin: 50px auto; display: flex; background: white; padding: 40px; border-radius: 12px; gap: 60px; box-shadow: 0 10px 40px rgba(0,0,0,0.1); }
        .details-left { flex: 1; display: flex; align-items: center; justify-content: center; }
        .details-left img { width: 100%; max-width: 450px; border-radius: 8px; }
        .details-right { flex: 1; }
        .details-right h1 { font-size: 32px; margin-bottom: 10px; }
        .details-price { color: #B12704; font-size: 28px; font-weight: bold; margin: 20px 0; }
        .checkout-box { border: 1px solid #ddd; padding: 25px; border-radius: 8px; background: #f9f9f9; }
    </style>
</head>
<body style="background: #eaeded;">
    <nav>
        <a href="index.jsp" class="logo">AmazonPremium</a>
        <a href="index.jsp" class="nav-link">Back to Results</a>
    </nav>

    <div class="details-wrapper">
        <div class="details-left">
            <img src="<%= p.getImage() %>">
        </div>
        
        <div class="details-right">
            <h1><%= p.getName() %></h1>
            <p style="color: #007185;">Brand: Premium Selection</p>
            <hr>
            <div class="details-price">$<%= p.getPrice() %></div>
            <p><b>About this item:</b><br>Our <%= p.getName() %> is crafted with precision and premium materials. 
               Experience high-end functionality and elite aesthetics in every detail. 
               Free shipping included with Amazon Premium membership.</p>
            
            <div class="checkout-box">
                <p style="color: green; font-weight: bold;">In Stock</p>
                <!-- BUTTON: Redirects to Checkout/Payment Page -->
                <a href="payment.jsp?id=<%= p.getId() %>" style="text-decoration: none;">
                    <button class="btn-premium" style="width: 100%; height: 50px; font-size: 16px;">
                        Add to Cart & Checkout
                    </button>
                </a>
            </div>
        </div>
    </div>
</body>
</html>
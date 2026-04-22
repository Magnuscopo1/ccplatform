<%@page import="com.common.model.User,com.common.model.Product,com.backend.dao.ProductDAO, java.util.List"%>
<%
    // AUTH WALL: Security check
    User u = (User) session.getAttribute("user");
    if(u == null) { 
        response.sendRedirect("login.jsp"); 
        return; 
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Amazon Premium | Exclusive Shop</title>
    
    <!-- Link to Premium Styles -->
    <link rel="stylesheet" href="style.css">
    
    <style>
        /* Navbar Specific Styling */
        nav {
            background-color: #131921;
            height: 65px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 5%;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            color: #febd69;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 25px;
        }

        .nav-link {
            color: white;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: 0.3s;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .nav-link:hover {
            color: #febd69;
        }

        #cart-count {
            background-color: #f3a847;
            color: #131921;
            padding: 2px 8px;
            border-radius: 50%;
            font-size: 12px;
            font-weight: 800;
            transition: 0.3s ease;
        }

        .logout-link {
            color: #f3a847 !important;
            border: 1px solid #f3a847;
            padding: 5px 12px;
            border-radius: 4px;
        }

        .logout-link:hover {
            background-color: #f3a847;
            color: #131921 !important;
        }

        /* Hero and Product Design */
        .hero {
            height: 400px;
            background: linear-gradient(rgba(0,0,0,0.4), #eaeded), 
                        url('https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?q=80&w=2000');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- NAVIGATION -->
    <nav>
        <a href="index.jsp" class="logo">AmazonPremium</a>
        
        <div class="nav-actions">
            <span style="color: white; font-size: 13px;">Hello, <b><%= u.getName() %></b></span>
            
            <!-- Specified Links: Home, Cart, Logout -->
            <a href="index.jsp" class="nav-link">Home</a>
            
            <a href="cart.jsp" class="nav-link">
                Cart <span id="cart-count">0</span>
            </a>
            
            <a href="logout" class="nav-link logout-link">Logout</a>
        </div>
    </nav>

    <!-- HERO -->
    <div class="hero">
        <div>
            <h1 style="font-size: 3.5rem; margin: 0;">Summer Elite Sale</h1>
            <p style="font-size: 1.2rem;">Premium brands, exclusive prices.</p>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="container">
        <%
            ProductDAO dao = new ProductDAO();
            List<Product> products = dao.getAllProducts();
            for(Product p : products) {
        %>
            <div class="card">
                <!-- Clickable product image -->
                <a href="product_details.jsp?id=<%= p.getId() %>">
                    <img src="<%= p.getImage() %>" alt="<%= p.getName() %>">
                </a>
                
                <h3><%= p.getName() %></h3>
                <p class="price">$<%= p.getPrice() %></p>
                
                <!-- Direct Redirection to Details as requested -->
                <a href="product_details.jsp?id=<%= p.getId() %>" style="text-decoration: none;">
                    <button class="btn-premium">Buy Now</button>
                </a>
            </div>
        <% } %>
    </div>

    <!-- FOOTER -->
    <footer style="background: #232f3e; color: white; padding: 40px; text-align: center; margin-top: 50px;">
        <p>&copy; 2024 Amazon Premium Clone | Designed for Excellence</p>
    </footer>

    <!-- Include the entity script at the bottom -->
    <script src="js/entity.js"></script>
</body>
</html>
<%@page import="com.common.model.User"%>
<% User u = (User) session.getAttribute("user"); if(u == null) { response.sendRedirect("login.jsp"); return; } %>
<html>
<head>
    <title>Your Premium Basket</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .cart-item { display: flex; align-items: center; background: white; padding: 15px; margin-bottom: 10px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }
        .cart-item img { width: 80px; height: 80px; object-fit: contain; margin-right: 20px; }
        .checkout-bar { background: white; padding: 30px; border-radius: 20px; position: sticky; top: 80px; height: fit-content; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
    </style>
</head>
<body style="background:#eaeded;">
    <nav>
        <a href="index.jsp" class="logo">AmazonPremium</a>
        <a href="index.jsp" class="nav-link">Continue Shopping</a>
    </nav>

    <div style="max-width: 1100px; margin: 40px auto; display: flex; gap: 30px; padding: 0 20px;">
        <!-- Left: List of multiple products -->
        <div style="flex: 2;" id="cart-list-container">
            <h2>Shopping Basket</h2>
            <hr>
            <!-- Items injected here by JS -->
        </div>

        <!-- Right: One-Shot Payment Summary -->
        <div style="flex: 1;">
            <div class="checkout-bar">
                <h3>Order Summary</h3>
                <p>Items: <span id="summary-count">0</span></p>
                <h2 style="color: #B12704;">Total: $<span id="summary-total">0.00</span></h2>
                <button class="btn-premium" onclick="proceedToPayment()" style="width:100%; height: 50px;">Proceed to One-Shot Payment</button>
            </div>
        </div>
    </div>

    <script>
        function loadCart() {
            let cart = JSON.parse(localStorage.getItem('premium_cart')) || [];
            let container = document.getElementById('cart-list-container');
            let total = 0;

            if(cart.length === 0) {
                container.innerHTML += "<h4>Your cart is empty.</h4>";
                return;
            }

            cart.forEach((item, index) => {
                total += item.price;
                container.innerHTML += `
                    <div class="cart-item">
                        <img src="${item.image}">
                        <div style="flex:1;">
                            <h4>${item.name}</h4>
                            <p style="color: #B12704; font-weight: bold;">$${item.price}</p>
                        </div>
                        <button onclick="removeItem(${index})" style="border:none; background:none; color:blue; cursor:pointer;">Remove</button>
                    </div>`;
            });
            document.getElementById('summary-total').innerText = total.toFixed(2);
            document.getElementById('summary-count').innerText = cart.length;
        }

        function proceedToPayment() {
            let total = document.getElementById('summary-total').innerText;
            if(total == "0.00") { alert("Cart is empty!"); return; }
            // Redirect to payment with the TOTAL amount
            window.location.href = "payment.jsp?total=" + total;
        }

        function removeItem(index) {
            let cart = JSON.parse(localStorage.getItem('premium_cart')) || [];
            cart.splice(index, 1);
            localStorage.setItem('premium_cart', JSON.stringify(cart));
            location.reload();
        }

        loadCart();
    </script>
</body>
</html>
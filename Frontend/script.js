/**
 * script.js
 * Mastermind Logic for Multi-Product Cart
 */

// Function to add an item and keep the user on the same page
function addToCart(id, name, price, image) {
    // 1. Get current cart from localStorage or create a new empty array
    let cart = JSON.parse(localStorage.getItem('premium_cart')) || [];

    // 2. Add the selected product as an object
    cart.push({
        id: id,
        name: name,
        price: parseFloat(price),
        image: image
    });

    // 3. Save the updated array back to localStorage
    localStorage.setItem('premium_cart', JSON.stringify(cart));

    // 4. Update the navbar count (1, 2, 3...)
    updateCartBadge();

    // 5. High-end feedback
    alert("✅ " + name + " added to your Elite Collection!");
}

// Function to calculate and update the badge number
function updateCartBadge() {
    let cart = JSON.parse(localStorage.getItem('premium_cart')) || [];
    let badge = document.getElementById('cart-count');
    
    if (badge) {
        badge.innerText = cart.length;
        
        // Add a small "pop" animation to the number
        badge.style.transform = "scale(1.2)";
        setTimeout(() => { badge.style.transform = "scale(1)"; }, 200);
    }
}

// Ensure the badge updates immediately when any page loads
document.addEventListener("DOMContentLoaded", updateCartBadge);
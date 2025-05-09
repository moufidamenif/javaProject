<%--
  Created by IntelliJ IDEA.
  User: mechs
  Date: 08/05/2025
  Time: 6:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membership - TOTC</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #6A6CE4;
            --secondary: #00C9A7;
            --dark: #1A3C34;
            --light: #F5F7FA;
            --gray: #5A5A5A;
            --white: #FFFFFF;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: var(--white);
            color: var(--dark);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header Styles */
        header {
            padding: 20px 0;
            background-color: var(--white);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: 700;
            color: var(--secondary);
        }

        nav {
            display: flex;
            gap: 20px;
        }

        nav a {
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            transition: color 0.3s;
        }

        nav a:hover {
            color: var(--secondary);
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }

        .user-profile span {
            font-weight: 500;
            color: var(--dark);
        }

        /* Pricing Section */
        .pricing-section {
            padding: 40px 0;
            text-align: center;
        }

        .pricing-section h1 {
            font-size: 36px;
            margin-bottom: 40px;
            color: var(--dark);
        }

        .pricing-plans {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .pricing-plan {
            background-color: var(--light);
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            text-align: left;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .pricing-plan.active {
            background-color: var(--white);
            border: 2px solid var(--secondary);
        }

        .pricing-plan h3 {
            font-size: 24px;
            margin-bottom: 10px;
            color: var(--dark);
        }

        .pricing-plan .price {
            font-size: 36px;
            color: var(--dark);
            margin-bottom: 10px;
        }

        .pricing-plan .duration {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 20px;
        }

        .pricing-plan ul {
            list-style: none;
            margin-bottom: 20px;
        }

        .pricing-plan li {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 10px;
        }

        .pricing-plan li::before {
            content: '✔';
            color: var(--secondary);
        }

        .pricing-plan .btn {
            display: block;
            text-align: center;
            padding: 10px;
            background-color: var(--secondary);
            color: var(--white);
            text-decoration: none;
            border-radius: 25px;
            font-weight: 500;
        }

        .pricing-plan.free .btn {
            background-color: transparent;
            border: 2px solid var(--secondary);
            color: var(--secondary);
        }

        /* Coaching Section */
        .coaching-section {
            padding: 40px 0;
            background-color: var(--dark);
            color: var(--white);
            text-align: center;
        }

        .coaching-section h2 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .coaching-section p {
            font-size: 16px;
            color: rgba(255, 255, 255, 0.7);
            max-width: 600px;
            margin: 0 auto 30px;
        }

        .coaching-section .btn {
            padding: 10px 30px;
            background-color: var(--secondary);
            color: var(--white);
            text-decoration: none;
            border-radius: 25px;
            font-weight: 500;
        }

        /* Lessons Section */
        .lessons-section {
            padding: 40px 0;
            background-color: var(--light);
        }

        .lessons-section h2 {
            font-size: 28px;
            margin-bottom: 20px;
            text-align: center;
        }

        .lessons-list {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .lesson-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 15px 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .lesson-item:last-child {
            border-bottom: none;
        }

        .lesson-item::before {
            content: '✔';
            color: var(--secondary);
            font-size: 20px;
        }

        .lesson-item p {
            font-size: 16px;
            color: var(--gray);
        }

        /* Testimonials Section */
        .testimonials-section {
            padding: 40px 0;
            background-color: var(--light);
            text-align: center;
        }

        .testimonials-section h2 {
            font-size: 28px;
            margin-bottom: 40px;
        }

        .testimonials {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .testimonial {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            width: 250px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: left;
        }

        .testimonial img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .testimonial h4 {
            font-size: 16px;
            margin-bottom: 5px;
        }

        .testimonial p {
            font-size: 14px;
            color: var(--gray);
        }

        /* App Section */
        .app-section {
            padding: 40px 0;
            background-color: var(--light);
            text-align: center;
        }

        .app-section h2 {
            font-size: 28px;
            margin-bottom: 30px;
        }

        .app-images {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .app-image {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            width: 400px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .app-image img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .app-image h3 {
            font-size: 20px;
            color: var(--primary);
            margin-bottom: 10px;
        }

        .app-image p {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 15px;
        }

        .app-image .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: var(--secondary);
            color: var(--white);
            text-decoration: none;
            border-radius: 25px;
            font-weight: 500;
        }

        /* Subscribe Section */
        .subscribe-section {
            padding: 40px 0;
            background-color: var(--dark);
            color: var(--white);
            text-align: center;
        }

        .subscribe-section h3 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .subscribe-form {
            display: flex;
            justify-content: center;
            gap: 10px;
            max-width: 500px;
            margin: 0 auto;
        }

        .subscribe-form input {
            padding: 10px 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 25px;
            font-size: 16px;
            outline: none;
            background-color: transparent;
            color: var(--white);
        }

        .subscribe-form input::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .subscribe-form button {
            padding: 10px 30px;
            background: var(--secondary);
            color: var(--white);
            border: none;
            border-radius: 25px;
            font-weight: 500;
            cursor: pointer;
        }

        /* Footer */
        footer {
            padding: 20px 0;
            background-color: var(--dark);
            color: var(--white);
            text-align: center;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 10px;
        }

        .footer-links a {
            color: var(--white);
            text-decoration: none;
            font-size: 14px;
        }

        .footer-links a:hover {
            color: var(--secondary);
        }

        .copyright {
            color: rgba(255, 255, 255, 0.7);
            font-size: 14px;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .pricing-plans,
            .testimonials,
            .app-images {
                flex-direction: column;
                align-items: center;
            }

            .pricing-plan,
            .testimonial,
            .app-image {
                width: 100%;
                max-width: 300px;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="container header-content">
        <div class="logo">TOTC</div>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="#">Courses</a>
            <a href="#">Careers</a>
            <a href="blog.jsp">Blog</a>
            <a href="#">About Us</a>
        </nav>
        <div class="user-profile">
            <img src="images/mimi1.png" alt="User">
            <span>Lina</span>
        </div>
    </div>
</header>

<section class="pricing-section">
    <div class="container">
        <h1>Affordable pricing</h1>
        <div class="pricing-plans">
            <div class="pricing-plan free">
                <h3>Free</h3>
                <div class="price">$0</div>
                <div class="duration">Forever free</div>
                <ul>
                    <li>Free forever plan</li>
                    <li>Free forever plan</li>
                    <li>Free forever plan</li>
                </ul>
                <a href="#" class="btn">Try for free</a>
            </div>
            <div class="pricing-plan active">
                <h3>$24</h3>
                <div class="price">$24</div>
                <div class="duration">Components-driven system</div>
                <ul>
                    <li>Sales-boosting landing pages</li>
                    <li>Awesome Feather icons pack</li>
                    <li>Themed into 3 different styles</li>
                    <li>Will help to learn Figma</li>
                </ul>
                <a href="#" class="btn">Regular license</a>
            </div>
            <div class="pricing-plan">
                <h3>$12</h3>
                <div class="price">$12</div>
                <div class="duration">Components-driven system</div>
                <ul>
                    <li>Sales-boosting landing pages</li>
                    <li>Awesome Feather icons pack</li>
                    <li>Themed into 3 different styles</li>
                </ul>
                <a href="#" class="btn">Extended license</a>
            </div>
        </div>
    </div>
</section>

<section class="coaching-section">
    <div class="container">
        <h2>Online coaching lessons for remote learning.</h2>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempos Lorem ipsum dolor sitamet, consectetur adipiscing elit, sed do eiusmod tempor.
        </p>
        <a href="#" class="btn">Start learning now</a>
    </div>
</section>

<section class="lessons-section">
    <div class="container">
        <h2>Online coaching lessons for remote learning</h2>
        <div class="lessons-list">
            <div class="lesson-item">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <div class="lesson-item">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <div class="lesson-item">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <div class="lesson-item">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
        </div>
    </div>
</section>

<section class="testimonials-section">
    <div class="container">
        <h2>What our students have to say</h2>
        <div class="testimonials">
            <div class="testimonial">
                <img src="images/mimi1.png" alt="Bukid Simons">
                <h4>Bukid Simons</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <div class="testimonial">
                <img src="images/mimi1.png" alt="Bukid Simons">
                <h4>Bukid Simons</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <div class="testimonial">
                <img src="images/mimi1.png" alt="Bukid Simons">
                <h4>Bukid Simons</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <div class="testimonial">
                <img src="images/mimi1.png" alt="Bukid Simons">
                <h4>Bukid Simons</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
        </div>
    </div>
</section>

<section class="app-section">
    <div class="container">
        <h2>App is available for free</h2>
        <div class="app-images">
            <div class="app-image">
                <img src="images/rblog1.png" alt="Become a Teacher">
                <h3>Become a Teacher</h3>
                <p>Class, launched less than a year ago by Blackboard co-founder Michael Chasen, integrates exclusively...</p>
                <a href="#" class="btn">Apply as teacher</a>
            </div>
            <div class="app-image">
                <img src="images/rblog2.png" alt="Become a Coursetaker">
                <h3>Become a Coursetaker</h3>
                <p>Class, launched less than a year ago by Blackboard co-founder Michael Chasen, integrates exclusively...</p>
                <a href="#" class="btn">Apply as coursetaker</a>
            </div>
        </div>
    </div>
</section>

<section class="subscribe-section">
    <div class="container">
        <h3>Subscribe to get our Newsletter</h3>
        <form class="subscribe-form">
            <input type="email" placeholder="Your Email">
            <button type="submit">Subscribe</button>
        </form>
    </div>
</section>

<footer>
    <div class="container">
        <div class="footer-links">
            <a href="#">Careers</a>
            <a href="#">Privacy Policy</a>
            <a href="#">Terms & Conditions</a>
        </div>
        <div class="copyright">© 2021 Class Technologies Inc.</div>
    </div>
</footer>
</body>
</html>
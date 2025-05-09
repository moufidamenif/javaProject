<%--
  Created by IntelliJ IDEA.
  User: mechs
  Date: 08/05/2025
  Time: 7:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Detail - TOTC</title>
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

        /* Course Header */
        .course-header {
            padding: 40px 0;
            background-color: var(--light);
            text-align: center;
        }

        .course-header img {
            width: 100%;
            max-height: 300px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .course-header .price {
            font-size: 24px;
            color: var(--dark);
            margin-bottom: 10px;
        }

        .course-header .discount {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 20px;
        }

        /* Ratings Section */
        .ratings-section {
            display: flex;
            gap: 20px;
            justify-content: center;
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto 40px;
        }

        .ratings-section .rating {
            text-align: center;
        }

        .ratings-section .rating h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .ratings-section .rating .stars {
            color: #FFD700;
            margin-bottom: 10px;
        }

        .ratings-section .rating .bar {
            width: 100px;
            height: 10px;
            background-color: var(--light);
            border-radius: 5px;
            margin: 5px auto;
        }

        .ratings-section .rating .bar-fill {
            height: 100%;
            background-color: var(--secondary);
            border-radius: 5px;
        }

        .ratings-section .rating p {
            font-size: 14px;
            color: var(--gray);
        }

        /* Purchase Section */
        .purchase-section {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 300px;
            margin: 0 auto;
            text-align: center;
        }

        .purchase-section h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .purchase-section ul {
            list-style: none;
            text-align: left;
            margin-bottom: 20px;
        }

        .purchase-section li {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 10px;
        }

        .purchase-section li::before {
            content: '✔';
            color: var(--secondary);
        }

        .purchase-section .btn {
            display: block;
            padding: 10px;
            background-color: var(--secondary);
            color: var(--white);
            text-decoration: none;
            border-radius: 25px;
            font-weight: 500;
        }

        .purchase-section .social {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .purchase-section .social a {
            color: var(--gray);
            font-size: 20px;
        }

        /* Marketing Articles Section */
        .marketing-section {
            padding: 40px 0;
            background-color: var(--light);
            text-align: center;
        }

        .marketing-section h2 {
            font-size: 24px;
            margin-bottom: 40px;
        }

        .marketing-articles {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .marketing-article {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            width: 200px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .marketing-article img {
            width: 100%;
            height: 120px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .marketing-article h3 {
            font-size: 16px;
            margin-bottom: 10px;
            color: var(--primary);
        }

        .marketing-article p {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 10px;
        }

        .marketing-article .price {
            font-weight: bold;
            color: var(--dark);
        }

        .marketing-article .author {
            font-size: 14px;
            color: var(--gray);
        }

        /* Classroom Section */
        .classroom-section {
            padding: 40px 0;
            background-color: var(--light);
            text-align: center;
        }

        .classroom-section .highlight {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto 40px;
        }

        .classroom-section .highlight h2 {
            font-size: 20px;
            margin-bottom: 15px;
        }

        .classroom-section .highlight p {
            font-size: 14px;
            color: var(--gray);
        }

        .classroom-section img {
            width: 100%;
            max-height: 300px;
            object-fit: cover;
            border-radius: 10px;
        }

        /* Top Offers Section */
        .top-offers-section {
            padding: 40px 0;
            text-align: center;
        }

        .top-offers-section h2 {
            font-size: 24px;
            margin-bottom: 40px;
        }

        .top-offers {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .top-offer {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            width: 200px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .top-offer h3 {
            font-size: 16px;
            margin-bottom: 10px;
            color: #FF4D4D;
        }

        .top-offer p {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 10px;
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
            .ratings-section {
                flex-direction: column;
                align-items: center;
            }

            .marketing-articles,
            .top-offers {
                flex-direction: column;
                align-items: center;
            }

            .marketing-article,
            .top-offer {
                width: 100%;
                max-width: 300px;
            }

            .course-header img,
            .classroom-section img {
                max-height: 200px;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="container header-content">
        <div class="logo">TOTC</div>
        <nav>
            <a href="#">Home</a>
            <a href="#">Courses</a>
            <a href="#">Careers</a>
            <a href="#">Blog</a>
            <a href="#">About Us</a>
        </nav>
        <div class="user-profile">
            <img src="https://i.imgur.com/qWbHHQH.png" alt="User">
            <span>Lina</span>
        </div>
    </div>
</header>

<section class="course-header">
    <div class="container">
        <img src="images/rblog1.png" alt="Course Image">
        <div class="price">$49.65 <span class="discount">98% OFF</span></div>
    </div>
</section>

<div class="container">
    <div class="ratings-section">
        <div class="rating">
            <h3>4 out of 5</h3>
            <div class="stars">★★★★☆</div>
            <div class="bar"><div class="bar-fill" style="width: 80%;"></div></div>
            <p>5 Stars</p>
            <div class="bar"><div class="bar-fill" style="width: 60%;"></div></div>
            <p>4 Stars</p>
            <div class="bar"><div class="bar-fill" style="width: 40%;"></div></div>
            <p>3 Stars</p>
            <div class="bar"><div class="bar-fill" style="width: 20%;"></div></div>
            <p>2 Stars</p>
            <div class="bar"><div class="bar-fill" style="width: 10%;"></div></div>
            <p>1 Star</p>
        </div>
        <div class="rating">
            <h3>Lina</h3>
            <p>Top rating</p>
            <p>Class, launched less than a year ago by Blackboard co-founder Michael Chasen, integrates exclusively...</p>
        </div>
        <div class="purchase-section">
            <h3>Buy Now</h3>
            <ul>
                <li>This Course Included</li>
                <li>90 Days of Free Updates</li>
                <li>Certification or completion</li>
            </ul>
            <a href="#" class="btn">Training 5 or more people</a>
            <div class="social">
                <a href="#">📘</a>
                <a href="#">🐦</a>
                <a href="#">🔗</a>
            </div>
        </div>
    </div>
</div>

<section class="marketing-section">
    <div class="container">
        <h2>Marketing Articles</h2>
        <div class="marketing-articles">
            <div class="marketing-article">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="marketing-article">
                <img src="images/rblog2.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="marketing-article">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="marketing-article">
                <img src="images/rblog2.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
        </div>
        <a href="#" class="view-all">See all</a>
    </div>
</section>

<section class="classroom-section">
    <div class="container">
        <div class="highlight">
            <h2>Everything you can do in physical classroom, you can do with TOTC</h2>
            <p>TOTC's school management software helps traditional payments and virtual classrooms all in one secure cloud-based system.</p>
        </div>
        <img src="images/rblog2.png" alt="Classroom">
    </div>
</section>

<section class="top-offers-section">
    <div class="container">
        <h2>Top Education offers and deals are listed here</h2>
        <div class="top-offers">
            <div class="top-offer">
                <h3>50% FOR INSTRUCTORS</h3>
                <p>TOTC's school management software helps traditional online schools manage scheduling.</p>
            </div>
            <div class="top-offer">
                <h3>50% FOR INSTRUCTORS</h3>
                <p>TOTC's school management software helps traditional online schools manage scheduling.</p>
            </div>
            <div class="top-offer">
                <h3>50% FOR INSTRUCTORS</h3>
                <p>TOTC's school management software helps traditional online schools manage scheduling.</p>
            </div>
        </div>
        <a href="#" class="view-all">See all</a>
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
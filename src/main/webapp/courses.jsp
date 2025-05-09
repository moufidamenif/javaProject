<%--
  Created by IntelliJ IDEA.
  User: mechs
  Date: 08/05/2025
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses - TOTC</title>
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

        /* Welcome Section */
        .welcome-section {
            padding: 40px 0;
            background-color: var(--light);
            text-align: center;
        }

        .welcome-section h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .welcome-section .courses {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .course-card {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .course-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .course-card h3 {
            font-size: 18px;
            margin-bottom: 10px;
            color: var(--primary);
        }

        .course-card p {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 10px;
        }

        .course-card .author {
            font-size: 14px;
            color: var(--gray);
        }

        .view-all {
            display: inline-block;
            margin-top: 20px;
            color: var(--secondary);
            text-decoration: none;
            font-weight: 500;
        }

        /* Categories Section */
        .categories-section {
            padding: 40px 0;
            text-align: center;
        }

        .categories-section h2 {
            font-size: 24px;
            margin-bottom: 40px;
        }

        .categories {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .category-card {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            width: 200px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .category-card .icon {
            width: 50px;
            height: 50px;
            background-color: var(--light);
            border-radius: 50%;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--secondary);
            font-size: 24px;
        }

        .category-card h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .category-card p {
            font-size: 14px;
            color: var(--gray);
        }

        /* Recommended Section */
        .recommended-section {
            padding: 40px 0;
            background-color: var(--light);
            text-align: center;
        }

        .recommended-section h2 {
            font-size: 24px;
            margin-bottom: 40px;
        }

        .recommended-courses {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .recommended-course {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            width: 200px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .recommended-course img {
            width: 100%;
            height: 120px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .recommended-course h3 {
            font-size: 16px;
            margin-bottom: 10px;
            color: var(--primary);
        }

        .recommended-course p {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 10px;
        }

        .recommended-course .price {
            font-weight: bold;
            color: var(--dark);
        }

        .recommended-course .author {
            font-size: 14px;
            color: var(--gray);
        }

        /* Get Choice Section */
        .get-choice-section {
            padding: 40px 0;
            text-align: center;
        }

        .get-choice-section h2 {
            font-size: 24px;
            margin-bottom: 40px;
        }

        .get-choice-courses {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .get-choice-course {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            width: 200px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .get-choice-course img {
            width: 100%;
            height: 120px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .get-choice-course h3 {
            font-size: 16px;
            margin-bottom: 10px;
            color: var(--primary);
        }

        .get-choice-course p {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 10px;
        }

        .get-choice-course .price {
            font-weight: bold;
            color: var(--dark);
        }

        .get-choice-course .author {
            font-size: 14px;
            color: var(--gray);
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

        /* Personal Development Section */
        .personal-dev-section {
            padding: 40px 0;
            text-align: center;
        }

        .personal-dev-section h2 {
            font-size: 24px;
            margin-bottom: 40px;
        }

        .personal-dev-courses {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .personal-dev-course {
            background-color: var(--white);
            border-radius: 10px;
            padding: 20px;
            width: 200px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .personal-dev-course img {
            width: 100%;
            height: 120px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .personal-dev-course h3 {
            font-size: 16px;
            margin-bottom: 10px;
            color: var(--primary);
        }

        .personal-dev-course p {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 10px;
        }

        .personal-dev-course .price {
            font-weight: bold;
            color: var(--dark);
        }

        .personal-dev-course .author {
            font-size: 14px;
            color: var(--gray);
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
            .courses,
            .categories,
            .recommended-courses,
            .get-choice-courses,
            .personal-dev-courses {
                flex-direction: column;
                align-items: center;
            }

            .course-card,
            .category-card,
            .recommended-course,
            .get-choice-course,
            .personal-dev-course {
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
            <a href="#">Home</a>
            <a href="#">Courses</a>
            <a href="#">Careers</a>
            <a href="#">Blog</a>
            <a href="#">About Us</a>
        </nav>
        <div class="user-profile">
            <img src="images/mimi1.png" alt="User">
            <span>Lina</span>
        </div>
    </div>
</header>

<section class="welcome-section">
    <div class="container">
        <h1>Welcome back, ready for your next lesson?</h1>
        <div class="courses">
            <div class="course-card">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lesson #1</p>
                <div class="author">Lina</div>
            </div>
            <div class="course-card">
                <img src="images/rblog2.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lesson #2</p>
                <div class="author">Lina</div>
            </div>
            <div class="course-card">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lesson #3</p>
                <div class="author">Lina</div>
            </div>
        </div>
        <a href="#" class="view-all">View all</a>
    </div>
</section>

<section class="categories-section">
    <div class="container">
        <h2>Choose favourite course from top category</h2>
        <div class="categories">
            <div class="category-card">
                <div class="icon">✏️</div>
                <h3>Design</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category-card">
                <div class="icon">💻</div>
                <h3>Development</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category-card">
                <div class="icon">🎬</div>
                <h3>Development</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category-card">
                <div class="icon">🏢</div>
                <h3>Business</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category-card">
                <div class="icon">📈</div>
                <h3>Marketing</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category-card">
                <div class="icon">📷</div>
                <h3>Photography</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category-card">
                <div class="icon">🎭</div>
                <h3>Acting</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="category-card">
                <div class="icon">🏠</div>
                <h3>Business</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
        </div>
    </div>
</section>

<section class="recommended-section">
    <div class="container">
        <h2>Recommended for you</h2>
        <div class="recommended-courses">
            <div class="recommended-course">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="recommended-course">
                <img src="images/rblog2.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="recommended-course">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="recommended-course">
                <img src="images/rblog2.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="recommended-course">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="recommended-course">
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

<section class="get-choice-section">
    <div class="container">
        <h2>Get choice of your course</h2>
        <div class="get-choice-courses">
            <div class="get-choice-course">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="get-choice-course">
                <img src="images/rblog2.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="get-choice-course">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="get-choice-course">
                <img src="images/rblog2.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="get-choice-course">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="get-choice-course">
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

<section class="coaching-section">
    <div class="container">
        <h2>Online coaching lessons for remote learning.</h2>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempos Lorem ipsum dolor sitamet, consectetur adipiscing elit, sed do eiusmod tempor.
        </p>
        <a href="#" class="btn">Start learning now</a>
    </div>
</section>

<section class="personal-dev-section">
    <div class="container">
        <h2>The course in personal development</h2>
        <div class="personal-dev-courses">
            <div class="personal-dev-course">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="personal-dev-course">
                <img src="images/rblog2.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="personal-dev-course">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="personal-dev-course">
                <img src="images/rblog2.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="personal-dev-course">
                <img src="images/rblog1.png" alt="AWS Certified Solutions Architect">
                <h3>AWS Certified Solutions Architect</h3>
                <p>Lorem ipsum dolor sit amet.</p>
                <div class="price">$80</div>
                <div class="author">Lina</div>
            </div>
            <div class="personal-dev-course">
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
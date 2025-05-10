<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog - TOTC</title>
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

        .blog-header {
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

        /* Main Blog Post */
        .main-blog {
            display: flex;
            gap: 30px;
            padding: 40px 0;
            background-color: var(--light);
            border-radius: 10px;
            margin-top: 20px;
        }

        .main-blog .content {
            flex: 1;
        }

        .blog-meta {
            color: var(--secondary);
            font-size: 14px;
            margin-bottom: 10px;
        }

        .blog-title {
            font-size: 36px;
            line-height: 1.3;
            margin-bottom: 15px;
            color: var(--primary);
        }

        .blog-text {
            color: var(--gray);
            font-size: 16px;
            margin-bottom: 20px;
        }

        .start-learning {
            display: inline-block;
            padding: 10px 20px;
            background-color: var(--secondary);
            color: var(--white);
            text-decoration: none;
            border-radius: 25px;
            font-weight: 500;
        }

        .main-blog .image {
            flex: 1;
        }

        .main-blog img {
            width: 100%;
            border-radius: 10px;
            object-fit: cover;
            max-height: 300px;
        }

        /* Reading Blog List */
        .reading-list {
            padding: 40px 0;
        }

        .section-title {
            font-size: 24px;
            margin-bottom: 20px;
            color: var(--dark);
        }

        .blog-list {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .blog-list .item {
            flex: 1;
            min-width: 200px;
            background-color: var(--light);
            border-radius: 10px;
            padding: 15px;
            text-align: center;
        }

        .blog-list img {
            width: 100%;
            height: 120px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 10px;
        }

        .blog-list .item span {
            font-weight: 500;
            font-size: 16px;
        }

        .see-all {
            display: inline-block;
            margin-top: 20px;
            color: var(--secondary);
            text-decoration: none;
            font-weight: 500;
        }

        /* Related Blog */
        .related-blog-section {
            padding: 40px 0;
        }

        .related-blog {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .related-blog .blog-card {
            flex: 1;
            min-width: 300px;
            background-color: var(--light);
            border-radius: 10px;
            padding: 15px;
        }

        .related-blog img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .related-blog h4 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .related-blog p {
            color: var(--gray);
            font-size: 14px;
            margin-bottom: 10px;
        }

        .related-blog .author {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
            color: var(--gray);
        }

        .related-blog .author img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
        }

        .related-blog .views {
            margin-top: 10px;
            font-size: 14px;
            color: var(--gray);
        }

        .related-blog .read-more {
            color: var(--secondary);
            text-decoration: none;
            font-weight: 500;
        }

        .pagination {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .pagination a {
            padding: 5px 10px;
            background-color: var(--light);
            border-radius: 5px;
            text-decoration: none;
            color: var(--dark);
        }

        .pagination a.active {
            background-color: var(--secondary);
            color: var(--white);
        }

        /* Marketing Articles */
        .marketing-articles {
            padding: 40px 0;
        }

        .articles-list {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .articles-list .article {
            flex: 1;
            min-width: 200px;
            background-color: var(--light);
            border-radius: 10px;
            padding: 15px;
        }

        .articles-list img {
            width: 100%;
            height: 120px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 10px;
        }

        .articles-list .category {
            font-size: 12px;
            color: var(--secondary);
            margin-bottom: 5px;
        }

        .articles-list h4 {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .articles-list .author {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
            color: var(--gray);
        }

        .articles-list .author img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
        }

        .articles-list .price {
            font-weight: bold;
            margin-top: 10px;
            color: var(--dark);
        }

        /* Subscribe Section */
        .subscribe-section {
            padding: 40px 0;
            text-align: center;
            background-color: var(--dark);
            color: var(--white);
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
            background-color: var(--dark);
            color: var(--white);
            padding: 20px 0;
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
            .main-blog {
                flex-direction: column;
            }

            .main-blog img {
                max-height: 200px;
            }

            .blog-list .item,
            .related-blog .blog-card,
            .articles-list .article {
                min-width: 100%;
            }

            .subscribe-form {
                flex-direction: column;
                gap: 15px;
            }

            .subscribe-form input,
            .subscribe-form button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="container blog-header">
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

<div class="container">
    <section class="main-blog">
        <div class="content">
            <div class="blog-meta">By Themadbrains in Inspiration</div>
            <h1 class="blog-title">Why Swift UI Should Be on the Radar of Every Mobile Developer</h1>
            <p class="blog-text">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            </p>
            <a href="#" class="start-learning">Start learning now</a>
        </div>
        <div class="image">
            <img src="images/rblog2.png" alt="Swift UI Development">
        </div>
    </section>

    <section class="reading-list">
        <h3 class="section-title">Reading blog list</h3>
        <div class="blog-list">
            <div class="item">
                <img src="images/ux.png" alt="UX/UI Design">
                <span>UX/UI</span>
            </div>
            <div class="item">
                <img src="images/react.png" alt="React Framework">
                <span>React</span>
            </div>
            <div class="item">
                <img src="images/php.png" alt="PHP Programming">
                <span>PHP</span>
            </div>
            <div class="item">
                <img src="images/javascript.png" alt="JavaScript Programming">
                <span>JavaScript</span>
            </div>
        </div>
        <a href="#" class="see-all">See all</a>
    </section>

    <section class="related-blog-section">
        <h3 class="section-title">Related Blog</h3>
        <div class="related-blog">
            <div class="blog-card">
                <img src="images/rblog1.png" alt="Related Blog 1">
                <h4>Class adds $30 million to its balance sheet for a Zoom-friendly edtech solution</h4>
                <div class="author">
                    <img src="https://i.imgur.com/qWbHHQH.png" alt="Author">
                    <span>Lina</span>
                </div>
                <p>Class, launched less than a year ago by Blackboard co-founder Michael Chasen, integrates exclusively...</p>
                <div class="views">256,232</div>
                <a href="#" class="read-more">Read more</a>
            </div>
            <div class="blog-card">
                <img src="images/rblog2.png" alt="Related Blog 2">
                <h4>Class adds $30 million to its balance sheet for a Zoom-friendly edtech solution</h4>
                <div class="author">
                    <img src="https://i.imgur.com/qWbHHQH.png" alt="Author">
                    <span>Lina</span>
                </div>
                <p>Class, launched less than a year ago by Blackboard co-founder Michael Chasen, integrates exclusively...</p>
                <div class="views">256,232</div>
                <a href="#" class="read-more">Read more</a>
            </div>
        </div>
        <div class="pagination">
            <a href="#">←</a>
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">→</a>
        </div>
    </section>

    <section class="marketing-articles">
        <h3 class="section-title">Marketing Articles</h3>
        <div class="articles-list">
            <div class="article">
                <img src="images/article1.jpg" alt="Article 1">
                <div class="category">AWS Certified solutions Architect</div>
                <h4>AWS Certified solutions Architect</h4>
                <div class="author">
                    <img src="https://i.imgur.com/qWbHHQH.png" alt="Author">
                    <span>Lina</span>
                </div>
                <div class="price">$80</div>
            </div>
            <div class="article">
                <img src="images/article2.jpg" alt="Article 2">
                <div class="category">AWS Certified solutions Architect</div>
                <h4>AWS Certified solutions Architect</h4>
                <div class="author">
                    <img src="https://i.imgur.com/qWbHHQH.png" alt="Author">
                    <span>Lina</span>
                </div>
                <div class="price">$80</div>
            </div>
            <div class="article">
                <img src="images/article3.jpg" alt="Article 3">
                <div class="category">AWS Certified solutions Architect</div>
                <h4>AWS Certified solutions Architect</h4>
                <div class="author">
                    <img src="https://i.imgur.com/qWbHHQH.png" alt="Author">
                    <span>Lina</span>
                </div>
                <div class="price">$80</div>
            </div>
            <div class="article">
                <img src="images/article4.jpg" alt="Article 4">
                <div class="category">AWS Certified solutions Architect</div>
                <h4>AWS Certified solutions Architect</h4>
                <div class="author">
                    <img src="https://i.imgur.com/qWbHHQH.png" alt="Author">
                    <span>Lina</span>
                </div>
                <div class="price">$80</div>
            </div>
        </div>
        <a href="#" class="see-all">See all</a>
    </section>
</div>

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
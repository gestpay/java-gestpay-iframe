<%
    Cookie cookie = new Cookie("base_url", request.getContextPath());
    cookie.setMaxAge(60*60);
    response.addCookie(cookie);
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.3.2/css/bulma.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>The BEST ecommerce EVER</title>
</head>
<body>
<section class="hero is-medium is-primary is-bold">
    <div class="hero-body">
        <div class="container">
            <h1 class="title">
                The BEST ecommerce... EVER!
            </h1>
            <h2 class="subtitle">
                We sell good stuff
            </h2>
        </div>
    </div>
</section>
<section class="section container">
    <div class="columns">
        <div class="column">
            <div class="card">
                <div class="card-image">
                    <figure class="image is-4by3">
                        <img src="images/pineapples.jpeg" alt="Image">
                    </figure>
                </div>
                <div class="card-content">
                    <div class="media">
                        <div class="media-content">
                            <form action="pay" method="POST">
                                <input type="hidden" name="item" value="two pineapples">
                                <input type="hidden" name="amount" value="15">
                                <input class="button is-primary is-clearfix is-pulled-right" type="submit" value="Buy" />
                            </form>
                            <p class="title is-4">Two pineapples</p>
                            <p class="subtitle is-6">15&euro;</p>
                        </div>
                    </div>

                    <div class="content">
                        Two juicy pineapples, for your hungry moments.
                    </div>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <div class="card-image">
                    <figure class="image is-4by3">
                        <img src="images/church-lake.jpeg" alt="Image">
                    </figure>
                </div>
                <div class="card-content">
                    <div class="media">
                        <div class="media-content">
                            <form action="pay" method="POST">
                                <input type="hidden" name="item" value="Church on Lake">
                                <input type="hidden" name="amount" value="75">
                                <input class="button is-primary is-clearfix is-pulled-right" type="submit" value="Buy" />
                            </form>
                            <p class="title is-4">Church on Lake</p>
                            <p class="subtitle is-6">75&euro;</p>
                        </div>
                    </div>

                    <div class="content">
                        Want to relax and prey? Get this church and enjoy the view.
                    </div>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <div class="card-image">
                    <figure class="image is-4by3">
                        <img src="images/old-computer.jpeg" alt="Image">
                    </figure>
                </div>
                <div class="card-content">
                    <div class="media">
                        <div class="media-content">
                            <form action="pay" method="POST">
                                <input type="hidden" name="item" value="Old Computer" />
                                <input type="hidden" name="amount" value="20" />
                                <input class="button is-primary is-clearfix is-pulled-right" type="submit" value="Buy" />
                            </form>
                            <p class="title is-4">Old Computer</p>
                            <p class="subtitle is-6">20&euro;</p>
                        </div>
                    </div>

                    <div class="content">
                        We hope you know how to use it. We don't.
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>

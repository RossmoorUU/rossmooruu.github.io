---
title: Home
layout: default
---
<section>
    <div class="container text-center home-head">
        <h1>Rossmoor Unitarian Universalists</h1>
        <p class="lead text-muted">We meet in the Vista Room of the Hillside complex on the second Friday of each month for a brown-bag lunch program.</p>
        <p></p>
    </div>
    <div class="container">
        {% for program in site.data.next_program %}
        <div class="row">
            <h2>{{ program.date }}</h2>
            <p>Doors open at 11:15 with the program to begin at 11:30.</p>
        </div>
        <div class="row">
            <div class="col-4">
                <img src="assets/images/{{ program.image }}" class="img-fluid">
            </div>
            <div class="col-8">
                <h2>{{ program.title }}</h2>
                <p>{{ program.description  }}</p>
                <h3>{{ program.speaker }}</h3>
                <p>{{ program.biography }}</p>
            </div>
        </div>
        {% endfor %}
    </div>
    <div class="bg-yellow">
        <div class="container text-center home-head bg-yellow">
            <h1>UUA Condemns U.S. Military Action Against Iran</h1>
        </div>
        <div>
            <p>June 21, 2025</p>
            <p>The Unitarian Universalist Association (UUA) condemns U.S. military involvement in the expanding conflict between Israel and Iran. The involvement of the United States will only escalate a deepening crisis of war in the region, lead to an even greater loss of life, and prevent diplomatic resolution to the region's geopolitical challenges.</p>
            <p><a href="https://www.uua.org/pressroom/press-releases/uua-condemns-action-against-iran">Read the full statement</a></p>
        </div>
    </div>
    <hr>
    <div class="row">
        <h2>Upcoming Events</h2>
        <p>Here are some events that may be of interest. They are not necesarily affiliated with 
        Rossmoor UU.</p><hr>
        {% for event in site.data.events %}
        <div class="col-12 col-md-4">
            <h3 style="text-align: center;">{{ event.title }}</h3>
            <h4 style="text-align: center;">{{ event.date }}</h4>
            <p>{{ event.description }}</p>
            {% if event.link > "" %}
                <p><a href="{{ event.link }}" target="_blank">For more information</a></p>
            {% endif %}
            {% if event.image > "" %}
                <img src="assets/images/{{ event.image }}" class="img-fluid">
            {% endif %}
            <hr>
        </div>
        {% endfor %}
    </div>
</section>
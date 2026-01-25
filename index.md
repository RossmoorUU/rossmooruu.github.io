---
title: Home
layout: default
---
<section>
    {% include banner.html %} 
    <div class="container text-center home-head">
        <h1>Unitarian Universalists of Rossmoor</h1>
        <p class="lead text-muted">We are dedicated to nurturing spiritual growth, fostering inclusive fellowship, 
        and promoting compassion, justice, and lifelong learning. We meet the second Friday of every month in the Vista Room
        of the Hillside Complex. </p>
        <p></p>
    </div>
    <div class="container">
        {% for program in site.data.next_program %}
        <div class="row">
            <h2>{{ program.date }}</h2>
            {% if program.date> "" %}
            <p>Doors open at 11:15 with the program to begin at 11:30.</p>
            {% endif %}
        </div>
        <div class="row">
            <div class="col-4 fs-6">
                <img src="assets/images/{{ program.image }}" class="img-fluid" alt="{{ program.image_alt }}">
                <p class="small">{{ program.image_attribution }}</p>
            </div>
            <div class="col-8">
                <h2>{{ program.title }}</h2>
                <h3>{{ program.subtitle }}</h3>
                <p>{{ program.description  }}</p>
                <h3>{{ program.speaker }}</h3>
                <p>{{ program.biography }}</p>
            </div>
        </div>
        {% endfor %}
    </div>
</section>
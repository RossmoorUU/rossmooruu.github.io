---
title: Home
layout: default
---
<section>
    <!--{% include banner.html %}--> 
    <div class="container text-center home-head">
        <h1>Unitarian Universalists of Rossmoor</h1>
        <p class="lead text-muted">We are dedicated to nurturing spiritual growth, fostering inclusive fellowship, and promoting compassion, justice, and lifelong learning. 
        We meet the second Friday of every month.
        </p>
        <p></p>
    </div>
    <div class="container">
        {% for program in site.data.next_program %}
        {% if program.title and program.title != "" %}
        <div class="row">
            <h2>{{ program.date }}</h2>
            {% if program.date> "" %}
            <p>Doors open at 11:15 with the program to begin at 11:30 in the Vista Room of the Hillside Complex.</p>
            {% endif %}
        </div>
        <div class="row">
            <div class="col-12">
                <h2>{{ program.title }}</h2>
                {% if program.subtitle %}
                <h3>{{ program.subtitle }}</h3>
                {% endif %}
                <p>{{ program.description }}</p>
            </div>
        </div>
        {% if program.speaker %}
        <div class="row">
            {% if program.image %}
            <div class="col-4 fs-6">
                <img src="assets/images/{{ program.image }}" class="img-fluid" alt="{{ program.image_alt }}">
                {% if program.image_attribution %}
                <p class="small">{{ program.image_attribution }}</p>
                {% endif %}
            </div>
            {% endif %}
            <div class="{% if program.image %}col-8{% else %}col-12{% endif %}">
                <h3>{{ program.speaker }}</h3>
                <p>{{ program.speaker_bio }}</p>
            </div>
        </div>
        {% endif %}
        {% if program.speaker2 %}
        <div class="row">
            {% if program.image2 %}
            <div class="col-4 fs-6">
                <img src="assets/images/{{ program.image2 }}" class="img-fluid" alt="{{ program.image2_alt }}">
            </div>
            {% endif %}
            <div class="{% if program.image2 %}col-8{% else %}col-12{% endif %}">
                <h3>{{ program.speaker2 }}</h3>
                <p>{{ program.speaker2_bio }}</p>
            </div>
        </div>
        {% endif %}
        {% endif %}
        {% endfor %}
    </div>
</section>
---
title: Past Programs
layout: default
---
<section>
    <div class="container text-center">
        <h1>Past Programs</h1>
        <p class="lead text-muted"></p>
        <p></p>
    </div>
    <div class="container">
        {% for program in site.data.past_programs %}
        {% if program.title %}
        <div class="row">
            <div class="col-4">
                <h3>{{ program.date }}</h3>
                {% if program.image %}
                <img src="assets/images/{{ program.image }}" class="img-fluid" alt="{{ program.image_alt | default: program.speaker }}">
                {% endif %}
            </div>
            <div class="col-8">
                <h2>{{ program.title }}</h2>
                <p>{{ program.description  }}</p>
                {% if program.speaker %}
                <h3>{{ program.speaker }}</h3>
                {% endif %}
                <p>{{ program.biography }}</p>
            </div>
        </div>
        <hr>
        {% endif %}
        {% endfor %}
    </div>
</section>


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
                {% if program.image2 %}
                <img src="assets/images/{{ program.image2 }}" class="img-fluid" alt="{{ program.image2_alt | default: program.speaker2 }}">
                {% endif %}
            </div>
            <div class="col-8">
                <h2>{{ program.title }}</h2>
                <p>{{ program.description  }}</p>
                {% if program.speaker %}
                <h3>{{ program.speaker }}</h3>
                {% endif %}
                <p>{{ program.biography }}</p>
                {% if program.speaker2 %}
                <h3>{{ program.speaker2 }}</h3>
                {% endif %}
                {% if program.biography2 %}
                <p>{{ program.biography2 }}</p>
                {% endif %}
            </div>
        </div>
        <hr>
        {% endif %}
        {% endfor %}
    </div>
</section>


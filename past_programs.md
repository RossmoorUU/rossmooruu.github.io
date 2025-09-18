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
        <div class="row">
            <div class="col-4">
                <h3>{{ program.date }}</h3>
                <img src="assets/images/{{ program.image }}" class="img-fluid">
            </div>
            <div class="col-8">
                <h2>{{ program.title }}</h2>
                <p>{{ program.description  }}</p>
                <h3>{{ program.speaker }}</h3>
                <p>{{ program.biography }}</p>
            </div>
        </div>
        <hr>
        {% endfor %}
    </div>
</section>


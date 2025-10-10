---
title: Home
layout: default
---
<section>
    <div class="container text-center home-head">
        <h1>Rossmoor Unitarian Universalists</h1>
        <p class="lead text-muted">The place to find information about upcoming programs, speakers, and other resources
        for the Rossmoor Community.</p>
        <p></p>
    </div>
    <div class="container">
        {% for program in site.data.next_program %}
        <div class="row">
            <h2>{{ program.date }}</h2>
            <p>Doors open at 11:15 with the program to begin at 11:30.</p>
        </div>
        <div class="row">
            <div class="col-3">
                <img src="assets/images/{{ program.image }}" class="img-fluid">
            </div>
            <div class="col-9">
                <h2>{{ program.title }}</h2>
                <p>{{ program.description  }}</p>
            </div>
        </div>
         <div class="row">
            <h2>Speakers</h2>
            {% for speaker in program.speaker %}
            <div class="col-12 col-md-4">
                <h4 style="text-align: center;">{{ speaker.name }}</h4>
                <p><img src="assets/images/{{speaker.image}}" class="float-start w-50 p-2" alt="{{ speaker.image_alt }}">
                {{ speaker.biography }}</p>
            </div>
            {% endfor %}
        </div>
        <hr>
        {% endfor %}
    </div>
</section>
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
        {% for program in site.data.next_program_draft %}
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
        <hr>
        {% endfor %}
        <div class="row">
            <div class="col-4">
                <h3>Location</h3>
                <img src="https://placehold.co/300x300.png" class="img-fluid">
            </div>
            <div class="col-4">
                <h3>Contact</h3>
                <img src="https://placehold.co/300x300.png" class="img-fluid">
            </div>
            <div class="col-4">
                <h3>More Information</h3>
                <img src="https://placehold.co/300x300.png" class="img-fluid">
            </div>
        </div>
        <hr>
       
    </div>
</section>
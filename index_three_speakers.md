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
<!--         <div class="row">
            <h2>Speakers</h2>
            {% for speaker in program.speaker %}
            <div class="col-12 col-md-4">
                <h4 style="text-align: center;">{{ speaker.name }}</h4>
                <p><img src="assets/images/{{speaker.image}}" class="float-start w-50 p-2" alt="Photo of {{ speaker.name }}">
                {{ speaker.biography }}</p>
            </div>
            {% endfor %}
        </div> -->
        <hr>
        {% endfor %}
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
        <hr>
    </div>
</section>
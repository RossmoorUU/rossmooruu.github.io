---
title: Rossmoor UU
layout: default
---
<section>
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
    </div>
</section>
---
layout: default
title: "Prior Year Programs"
---
<p></p>
<section>
    <div class="container text-center">
        <h1>Past Programs 2024 and before</h1>
        <p class="lead text-muted"></p>
        <p></p>
    </div>
    <div class="container">
        <p class="lead text-muted"></p>
        <div class="row">
            <div class="col-2">
              <h3>Date</h3>
            </div>
            <div class="col-5">
              <h3>Description</h3>
            </div>
            <div class="col-5">
              <h3>Speaker</h3>
            </div>
            <hr>
        </div>
        {% for program in site.data.rmuu_past_programs %}
        <div class="row">
            <div class="col-2 .text-truncate">
              {{ program.date |  date_to_string: "ordinal", "US" }}
            </div>
            <div class="col-5">
              {{ program.description }} 
            </div>
            <div class="col-5">
             {{ program.speaker }}
            </div>
            <p></p>
        </div>
        {% endfor %}
    </div>
</section>


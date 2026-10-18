---
title: Home
layout: default
---
<section>
    <!--{% include banner.html %}-->
    <div class="container home-hero">
        <div class="row g-4 g-lg-5 align-items-center">
            <div class="col-lg-6">
                <p class="eyebrow">A gathering of Unitarian Universalists in Rossmoor</p>
                <h1>Unitarian Universalists of Rossmoor</h1>
                <p class="lead">We are dedicated to nurturing spiritual growth, fostering inclusive fellowship,
                    and promoting compassion, justice, and lifelong learning.</p>
                <div class="d-flex flex-wrap gap-2">
                    <a class="btn btn-teal" href="#next-program">See the next program</a>
                    <a class="btn btn-outline-teal" href="/about_unitarian_universalism">What is Unitarian Universalism?</a>
                </div>
            </div>
            <div class="col-lg-6">
                {% for program in site.data.next_program %}
                {% if program.title and program.title != "" %}
                <article class="tf-card" id="next-program">
                    <div class="tf-head">
                        {% if program.month_abbr and program.day %}
                        <span class="datechip"><span class="m">{{ program.month_abbr }}</span><span class="d">{{ program.day }}</span></span>
                        {% endif %}
                        <span>
                            <span class="lbl">Next program</span><br>
                            <span class="when">{{ program.date }} &middot; 11:30 am</span>
                        </span>
                    </div>
                    <div class="tf-body">
                        <h2>{{ program.title }}</h2>
                        {% if program.subtitle %}
                        <p class="tf-sub">{{ program.subtitle }}</p>
                        {% endif %}
                        <p>{{ program.description }}</p>
                        {% if program.speaker %}
                        <div class="speakers">
                            {% if program.image %}
                            <img src="assets/images/{{ program.image }}" alt="{{ program.image_alt | default: program.speaker }}">
                            {% endif %}
                            {% if program.image2 %}
                            <img src="assets/images/{{ program.image2 }}" alt="{{ program.image2_alt | default: program.speaker2 }}">
                            {% endif %}
                            <div class="who">
                                <strong>{{ program.speaker }}</strong>{% if program.speaker2 %} and <strong>{{ program.speaker2 }}</strong>{% endif %}
                            </div>
                        </div>
                        {% endif %}
                        <div class="chips">
                            <span class="chip">Vista Room, Hillside Complex</span>
                            <span class="chip">Doors open 11:15</span>
                            <span class="chip">All welcome, no charge</span>
                        </div>
                    </div>
                </article>
                {% endif %}
                {% endfor %}
            </div>
        </div>
    </div>

    <div class="container">
        <div class="facts">
            <div class="fact">
                <h3>When</h3>
                <p><strong>Second Friday, monthly</strong><br>Doors 11:15 &middot; program 11:30 am</p>
            </div>
            <div class="fact">
                <h3>Where</h3>
                <p><strong>Vista Room</strong><br>Hillside Complex, 3400 Golden Rain Road</p>
            </div>
            <div class="fact">
                <h3>Who</h3>
                <p><strong>Everyone welcome</strong><br>Rossmoor residents and their guests</p>
            </div>
        </div>
    </div>

    <div class="container speakers-section">
        <div class="sec-head">
            <div>
                <h2>This month's speakers</h2>
            </div>
        </div>
        {% for program in site.data.next_program %}
        {% if program.speaker %}
        <div class="row g-4 speaker-row">
            {% if program.image %}
            <div class="col-md-4">
                <img src="assets/images/{{ program.image }}" class="img-fluid speaker-photo" alt="{{ program.image_alt | default: program.speaker }}">
                {% if program.image_attribution %}
                <p class="small text-muted">{{ program.image_attribution }}</p>
                {% endif %}
            </div>
            {% endif %}
            <div class="{% if program.image %}col-md-8{% else %}col-12{% endif %}">
                <h3>{{ program.speaker }}</h3>
                <p>{{ program.speaker_bio }}</p>
            </div>
        </div>
        {% endif %}
        {% if program.speaker2 %}
        <div class="row g-4 speaker-row">
            {% if program.image2 %}
            <div class="col-md-4">
                <img src="assets/images/{{ program.image2 }}" class="img-fluid speaker-photo" alt="{{ program.image2_alt | default: program.speaker2 }}">
            </div>
            {% endif %}
            <div class="{% if program.image2 %}col-md-8{% else %}col-12{% endif %}">
                <h3>{{ program.speaker2 }}</h3>
                <p>{{ program.speaker2_bio }}</p>
            </div>
        </div>
        {% endif %}
        {% endfor %}
    </div>

    <div class="container coming-up">
        <div class="sec-head">
            <div>
                <h2>Coming up</h2>
                <p>One program a month. Free and open to all &mdash; no reservation needed.</p>
            </div>
            <a class="btn btn-outline-teal" href="/past_programs">Past programs</a>
        </div>
        <div class="row g-4">
            {% for program in site.data.next_program %}
            {% if program.title and program.title != "" %}
            <div class="col-md-4">
                <article class="pcard">
                    <span class="k">{{ program.date }}</span>
                    <h3>{{ program.title }}</h3>
                    {% if program.speaker %}
                    <p class="pcard-who">{{ program.speaker }}{% if program.speaker2 %} and {{ program.speaker2 }}{% endif %}</p>
                    {% endif %}
                </article>
            </div>
            {% endif %}
            {% endfor %}
            {% for program in site.data.upcoming_programs %}
            {% if program.title or program.speaker %}
            <div class="col-md-4">
                <article class="pcard">
                    <span class="k">{{ program.date }}</span>
                    {% if program.title %}
                    <h3>{{ program.title }}</h3>
                    {% elsif program.speaker %}
                    <h3>{{ program.speaker }}</h3>
                    {% endif %}
                    {% if program.title and program.speaker %}<p class="pcard-who">{{ program.speaker }}</p>{% endif %}
                </article>
            </div>
            {% endif %}
            {% endfor %}
        </div>
    </div>

    {% include signup.html %}

    <div class="container">
        <div class="uu-band">
            <div class="row g-4 align-items-center">
                <div class="col-lg-7">
                    <h2>What is Unitarian Universalism?</h2>
                    <p>Unitarian Universalism is a liberal faith that emphasizes the inherent worth and dignity of every
                        person, regardless of their background or beliefs. It draws on a wide range of spiritual
                        traditions, but rejects dogmatic or creedal forms of faith, focusing instead on individual
                        freedom, critical thinking, and social responsibility.</p>
                    <p><a href="/about_unitarian_universalism">Read more, and see the UUA's own resources &rarr;</a></p>
                </div>
                <div class="col-lg-5">
                    <div class="principle-list">
                        <span>Inherent worth of every person</span>
                        <span>Compassion in human relations</span>
                        <span>Justice and equity</span>
                        <span>Freedom of search for truth</span>
                        <span>Spiritual growth</span>
                        <span>World community</span>
                        <span>Respect for the web of life</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

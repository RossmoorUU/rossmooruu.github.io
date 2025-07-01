---
layout: default
title: Peggy's Book Corner
---
<section>
    <div class="container text-center home-head">
        <h1>Peggy's Book Corner</h1>
    </div>
    <div class="row">
        <p class="lead">At the heart of our spiritual community is a love of learning and a desire to deepen our understanding 
        of the world and our place in it. In recognition of this commitment, we are pleased to present a selection of 
        thought-provoking books, curated by our own Peggy Wilcox, that explore the complexities of human experience, the 
        nature of faith, and the quest for meaning and connection. These titles have been chosen to inspire reflection, 
        foster growth, and spark meaningful conversations within our community, as we continue on our journey together.</p>
        <p></p>
    </div>
    {% for book in site.data.books %}
    <div class="row">
        <div class="col-2">
            <img src="assets/images/books/{{ book.cover_image }}" alt="{{ book.title }}" class="img-fluid">
            <p></p>
        </div>
        <div class="col-8">
            <h3>{{ book.title }}</h3>
            <p><strong>Author:</strong> {{ book.author }}</p>
            <p>{{ book.description }}</p>
        </div>
    </div>
    {% endfor %}
</section>

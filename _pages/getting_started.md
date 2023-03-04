---
layout: single
title: Category - Getting Started
header:
  overlay_color: "#000"
  overlay_filter: "0.5"
  overlay_image: /assets/images/getting_started.jpeg
permalink: /categories/getting_started
excerpt: Software Engineering for beginners.
description: Software Engineering for beginners
---

{% assign post_list = site.posts | where:'category', 'Getting Started' %}

<div class="entries-{{ entries_layout }}">
{% for post in post_list %}
    {% include archive-single.html type=entries_layout format='category' %}
{% endfor %}
</div>

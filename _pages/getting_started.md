---
layout: single
title: Getting Started
header:
  overlay_color: "#000"
  overlay_filter: "0.5"
  overlay_image: /assets/images/getting_started.jpg
permalink: /categories/getting_started
---

{% assign post_list = site.posts | where:'category', 'Getting Started' %}

<div class="entries-{{ entries_layout }}">
{% for post in post_list %}
    {% include archive-single.html type=entries_layout format='category' %}
{% endfor %}
</div>

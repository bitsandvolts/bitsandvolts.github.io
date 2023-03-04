---
layout: single
title: Category - Digital Design
header:
  overlay_color: "#000"
  overlay_filter: "0.5"
  overlay_image: /assets/images/digital_design.jpeg
permalink: /categories/digital_design
excerpt: Introduction to digital design
description: Learn the basics of Digital Design
---

{% assign post_list = site.posts | where:'category', 'Digital Design' %}

<div class="entries-{{ entries_layout }}">
{% for post in post_list %}
    {% include archive-single.html type=entries_layout format='category' %}
{% endfor %}
</div>

---
layout: default
permalink: /
title: "Data Analytics"
---

Text here to make sure it works fine........... more text here

<div class="tiles">
{% for post in site.posts %}
	{% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->

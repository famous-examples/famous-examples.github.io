<!DOCTYPE HTML>
<html>
    <head>
        <title>famo.us App</title>
        <link rel="stylesheet" type="text/css" href="css/famous_styles.css" />
    </head>
    <body>
      <h1>famo.us examples</h1>
      <ol>
        {% for i in range(data.__len__()) -%}
        {%- set j = i + 1 -%}
        <li><a href="sample/{{ j }}.html">{{ data[j.__str__()] }}</a></li>
        {% endfor -%}
      </ol>
    </body>
</html>

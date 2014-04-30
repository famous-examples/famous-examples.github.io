{% for key, value in data.items() -%}
define(function(require, exports, module) {
  // choose your test here
  require('../{{ value }}');
});
{% endfor %}

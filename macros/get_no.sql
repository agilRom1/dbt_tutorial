-- Fajl: get_no.sql
{% macro get_category(arg1) %}
case when {{ arg1 }} > 40 then 'star'
     when {{ arg1 }} >= 30 and {{ arg1 }} <= 40 then 'target'
     when {{ arg1 }} < 30 then 'mlad'
     else 'n/a'
     end
{% endmacro %}

{% macro get_no(arg2) %}
{{ arg2 }} + 1
{% endmacro %}





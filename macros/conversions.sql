{% macro dol_euro(col, deci) -%}
    round(0.93 * {{col}}, {{deci}})
{%- endmacro %}
{% from "foo/map.jinja" import foo with context %}

{% for pkg, props in foo.packages.iteritems() %}
{% if props.install is not defined or props.install == true %}
foo-install-pkg-{{ pkg }}:
  {% if props.version is defined and props.version == 'latest' %}
  pkg.latest:
  {% else %}
  pkg.installed:
  {% endif %}
    - name: {{ pkg }}
    {% if props.version is defined %}
    - version: {{ props.version }}
    {% endif %}
    {% if props.skip_verify is defined %}
    - skip_verify: {{ props.skip_verify }}
    {% endif %}
    - require_in:
      - service: foo-service-running
    - watch_in:
      - service: foo-service-running
{% endif %}
{% endfor %}

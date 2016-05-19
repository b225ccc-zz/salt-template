{% from "foo/map.jinja" import foo with context %}

foo-service-running:
  service.running:
    - enable: True
    - name: "{{ foo.service_name }}"
    - require:
      - file: foo-config
    - watch:
      - file: foo-config

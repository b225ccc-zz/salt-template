{% from "foo/map.jinja" import foo with context %}

foo-config:
  file.managed:
    - name: {{ foo.config_file }}
    - source: salt://foo/files/foo.cnf.jinja
    - template: jinja
    - defaults:
        foo: {{ foo }}

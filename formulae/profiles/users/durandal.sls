{% set groups_list = salt['pillar.get']('users:durandal:groups', ['sudo'])  %}
---
durandal:
  user.present:
    - groups: {{ groups_list }}
    - require:
      - group: durandal
  group.present:
    - name: durandal

durandal sshkey key-20201231:
  ssh_auth.present:
    - user: durandal
    - enc: ssh-ed25519
    - comment: ed25519-key-20201231
    - name: AAAAC3NzaC1lZDI1NTE5AAAAICU8Cfm9HC+UGlwtMSWGASgriBN48zDrqidTPECrHV+s

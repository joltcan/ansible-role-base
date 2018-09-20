ansible-role-base
=================

Bootstrap host to sane defaults

Role Variables
--------------

There are a bunch of variables, all of them are described in the (defaults)[defaults/main.yml], but you shouldn't need to worry.

Here is an example to add some users. Let's put them in your (All)[group_vars/all] file:
```yaml
users:
 - name: 'PappaKeno'
   pubkey: 'ssh-ed25519 AAAAXXXYYYYZZZZ'
   comment: 'Fredrik'
   groups: 'adm'
   ssh_key_in_root: yes

ssh_extra_keys:
 - ssh-ed25519 AAAAXXXYYYYOOOO'

sudo_users_nopasswd:
  - PappaKeno

```


Example Playbook
----------------

My playbook has a pre-task to make sure python is available. You will need Python on the box to run ansible on the remote host

```yaml
---
- hosts: all
  gather_facts: False
  pre_tasks:
    - name: Install python if needed
      raw: test -e /usr/bin/python || (apt -y update && apt install -y python)
      register: output
      changed_when: output.stdout != ""

    # lets gather facts now that we have Python installed
    - name: Gather Facts
      setup:
  roles:
    - role: ansible-role-base
      become: true
```

License
-------

BSD

Author Information
------------------

Fredrik Lundhag - <f@mekk.com>
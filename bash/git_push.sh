#!/bin/bash

cd /opt/Ansible
git add -A
git commit -m "Committed automatically through script on $(date +'%m/%d/%Y-%T')"
git push

#!/usr/bin/env bash
cd /django-redis-sentinel/tests/

# Django 3
echo "<<<< Testing Django3 >>>"
alias python=python
echo "Switched to PY3K"
pip install -U 'Django>=3.1,<3.2'
python runtests-sentinel.py

echo "End of testing PY3K, Django>=3.1"

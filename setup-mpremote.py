#!/usr/bin/env python

from setuptools import setup, find_packages

setup(name='mpremote',
      version='1.20.0',
      # Modules to import from other scripts:
      packages=find_packages(),
      # Executables
      scripts=["mpremote/main.py"],
     )
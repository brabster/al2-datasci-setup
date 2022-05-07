#!/bin/bash

export PATH="~/.pyenv/shims:~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
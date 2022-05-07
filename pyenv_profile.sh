#!/bin/bash

set -euo pipefail

export PATH="~/.pyenv/shims:~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
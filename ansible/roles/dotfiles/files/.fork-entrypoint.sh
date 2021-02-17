#!/bin/bash
export PATH=$HOME/.serverless/bin:$HOME/.pyenv/shims:$HOME/.nodebrew/current/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
ssh-add -K $HOME/.ssh/github/id_rsa
exec "$@"
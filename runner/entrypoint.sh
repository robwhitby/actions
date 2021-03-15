#!/usr/bin/env bash
set -eu
cd /home/runner

TOKEN=$(curl -v -X POST -H "authorization: token ${GITHUB_PAT}" "https://api.github.com/orgs/${GITHUB_ORG}/actions/runners/registration-token" | jq -r .token)

./config.sh \
  --url "https://github.com/${GITHUB_ORG}" \
  --token "${TOKEN}" \
  --unattended \
  --replace

exec ./run.sh --once

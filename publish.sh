#!/usr/bin/env bash
# Publish the openai-compatible-gateway repo.
# Run this in YOUR terminal (where `gh` is installed + authenticated), NOT in
# the WorkBuddy sandbox. If gh isn't authenticated yet, run: gh auth login
set -e
cd "$(dirname "$0")"

REPO="openai-compatible-gateway"
DESC="Drop-in OpenAI-compatible API gateway. USDT settlement, no card, no KYC. Swap your base_url — keep your code."

# gh authenticated?
if ! gh auth status >/dev/null 2>&1; then
  echo "ERROR: gh not authenticated. Run: gh auth login"
  exit 1
fi

USER=$(gh api user --jq .login)
echo "Publishing as GitHub user: $USER"

# init / commit
git init -q 2>/dev/null || true
git add .
git commit -q -m "init: OpenAI-compatible gateway integration guide (multilingual)" \
  || echo "(nothing new to commit)"

# create public repo + push in one step
gh repo create "$REPO" --public --source=. --push --description "$DESC" \
  && echo "Repo live: https://github.com/$USER/$REPO" \
  || {
       echo "gh repo create failed (maybe '$REPO' already exists)."
       echo "If it exists, add remote + push manually:"
       echo "  git remote add origin https://github.com/$USER/$REPO.git"
       echo "  git branch -M main && git push -u origin main"
     }

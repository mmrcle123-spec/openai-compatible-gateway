#!/usr/bin/env bash
# Push all files to GitHub via REST API using a PAT (bypasses the MCP App 403
# that has no repo-creation permission).
# Usage: GH_TOKEN=ghp_xxx bash push_api.sh
set -u
TOKEN="${GH_TOKEN:?export GH_TOKEN=yourPAT first}"
OWNER="mmrcle123-spec"
REPO="openai-compatible-gateway"
BASE="/Users/mangguo/WorkBuddy/2026-07-27-17-22-33/air-gateway-docs"
DESC="Drop-in OpenAI-compatible API gateway. USDT settlement, no card, no KYC. Swap your base_url — keep your code."
API="https://api.github.com"
AUTH="Authorization: Bearer $TOKEN"
ACC="Accept: application/vnd.github+json"

echo "==> 1/2 create repo $OWNER/$REPO"
RESP=$(curl -s -o /tmp/gh_create.json -w "%{http_code}" -X POST -H "$AUTH" -H "$ACC" \
  "$API/user/repos" \
  -d "{\"name\":\"$REPO\",\"description\":\"$DESC\",\"private\":false}")
if [ "$RESP" = "201" ]; then echo "    repo created (201)";
elif [ "$RESP" = "422" ]; then echo "    repo already exists (422), continue pushing files";
else echo "    repo creation failed HTTP=$RESP"; cat /tmp/gh_create.json | head -c 400; exit 1; fi

echo "==> 2/2 push files"
cd "$BASE" || exit 1
N=0
while IFS= read -r f; do
  path="${f#./}"
  b64=$(base64 < "$f" | tr -d '\n')
  code=$(curl -s -o /tmp/gh_put.json -w "%{http_code}" -X PUT -H "$AUTH" -H "$ACC" \
    "$API/repos/$OWNER/$REPO/contents/$path" \
    -d "{\"message\":\"add $path\",\"content\":\"$b64\",\"branch\":\"main\"}")
  if [ "$code" = "201" ] || [ "$code" = "200" ]; then
    N=$((N+1)); echo "    [OK $code] $path"
  else
    echo "    [FAIL $code] $path"; head -c 300 /tmp/gh_put.json; echo
  fi
done < <(find . -type f -not -path './.git/*' | sort)
echo "==> done: pushed $N files"
echo "==> URL: https://github.com/$OWNER/$REPO"

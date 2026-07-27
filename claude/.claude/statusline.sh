#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
SESSION_ID=$(echo "$input" | jq -r '.session_id')

find /tmp -maxdepth 1 -name 'statusline-git-cache-*' -mmin +1440 -delete 2>/dev/null

CACHE_FILE="/tmp/statusline-git-cache-$SESSION_ID"
CACHE_MAX_AGE=5  # seconds

cache_is_stale() {
    [ ! -f "$CACHE_FILE" ] || \
    # stat -c %Y (Linux) or stat -f %m (macOS) prints the file's last-modified
    # time. The Linux form must run first: on Linux, the macOS form prints a
    # filesystem report to stdout before failing, and that output would be
    # captured by the command substitution and break the arithmetic.
    [ $(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null || stat -f %m "$CACHE_FILE" 2>/dev/null || echo 0))) -gt $CACHE_MAX_AGE ]
}

if cache_is_stale; then
    if git rev-parse --git-dir > /dev/null 2>&1; then
        BRANCH=$(git branch --show-current 2>/dev/null)
        STAGED=$(git diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
        MODIFIED=$(git diff --numstat 2>/dev/null | wc -l | tr -d ' ')
        echo "$BRANCH|$STAGED|$MODIFIED" > "$CACHE_FILE"
    else
        echo "||" > "$CACHE_FILE"
    fi
fi

IFS='|' read -r BRANCH STAGED MODIFIED < "$CACHE_FILE"

RATE_PCT=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
RATE_RESET=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')

USAGE=""
if [ -n "$RATE_PCT" ] && [ -n "$RATE_RESET" ]; then
    RESET_TIME=$(date -d "@$RATE_RESET" +"%-I:%M%p" | tr 'A-Z' 'a-z')
    USAGE="$(printf '%.0f' "$RATE_PCT")% | resets: $RESET_TIME"
fi

if [ -n "$BRANCH" ]; then
    LINE="[$MODEL] 📁 ${DIR##*/} | 🌿 $BRANCH staged:$STAGED modified:$MODIFIED"
else
    LINE="[$MODEL] 📁 ${DIR##*/}"
fi
[ -n "$USAGE" ] && LINE="$LINE | $USAGE"

echo "$LINE"

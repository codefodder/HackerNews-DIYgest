#!/usr/bin/env bash

HOUR_NOW=$(TZ=$TIMEZONE date +%H)
TODAY=$(TZ=$TIMEZONE date +%Y%m%d)
EMAIL_SENT_TODAY=$(bin/email-already-sent-today.sh ${TODAY})

echo "User override email target hour: $INPUTS_SEND_EMAIL"

if [[ "${INPUTS_SEND_EMAIL}" == 'yes please' ]]; then
  TARGET_HOUR="$HOUR_NOW"
  echo "Override target hour: $TARGET_HOUR"
  echo "TARGET_HOUR=$TARGET_HOUR" >> "$GITHUB_ENV"
fi

if [[ "$TARGET_HOUR" == "$HOUR_NOW" && "$EMAIL_SENT_TODAY" == "0" ]]; then
  SEND_MAIL="true"
else
  SEND_MAIL="false"
fi

echo "SEND_MAIL=${SEND_MAIL}" >> "$GITHUB_ENV"

cat <<DEBUG_EMAIL_SCHEDULE >> "$GITHUB_STEP_SUMMARY"

Email schedule info

- Email(s) Sent Today: ${EMAIL_SENT_TODAY}
- Today: ${TODAY}
- Timezone: ${TIMEZONE}
- Target Hour: ${TARGET_HOUR}
- Current Hour: ${HOUR_NOW}
- SEND_MAIL: ${SEND_MAIL}

DEBUG_EMAIL_SCHEDULE

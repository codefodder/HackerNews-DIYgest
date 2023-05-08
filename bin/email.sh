#!/usr/bin/env sh

GMAIL_ACCOUNT="jasonm23@gmail.com"
SENDER="Jason M <${GMAIL_ACCOUNT}>"
RECIPIENT="${GMAIL_ACCOUNT}"
BOUNDARY="boundarystring"

# Read the content of the plain text and HTML files into variables
#PLAIN_TEXT=$(cat plain_text.txt)
PLAIN_TEXT="DIY Hacker News Digest is coming very soon."

#HTML=$(cat html_body.html)
HTML="<h1>DIY Hacker News Digest is coming very soon</h1>"

# Create the email body by combining the plain text and HTML templates
BODY=$(cat << EOF
--${BOUNDARY}
Content-Type: multipart/alternative; boundary=${BOUNDARY}

--${BOUNDARY}
Content-Type: text/plain; charset=UTF-8

${PLAIN_TEXT}

--${BOUNDARY}
Content-Type: text/html; charset=UTF-8

${HTML}

--${BOUNDARY}--
EOF
)

# Send the email using the mail command
echo "${BODY}" | mail \
    -a "Content-Type: multipart/alternative; boundary=${BOUNDARY}" \
    -a "From: ${SENDER}" \
    -a "To: ${RECIPIENT}" \
    -s "Get ready for DIY HackerNews Digest" \
    -S smtp="smtp.gmail.com:587" \
    -S smtp-use-starttls \
    -S smtp-auth=login \
    -S smtp-auth-user="$GMAIL_ACCOUNT" \
    -S smtp-auth-password="$GAP" $GMAIL_ACCOUNT

#!/usr/bin/env python3

import os
import smtplib
import yaml
import sys
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

# Config file
email_config = "email_config.yaml"
from_line = "HackerNews DIYgest"
# Load environment variables
subject_line = os.getenv('SUBJECT_LINE')
gmail_password = os.getenv('GM_APPWRD')
gmail_user = os.getenv('GMAIL_USER')


def usage():
    print(f"""
    Usage:

    python3 email-send.py

    Requires {email_config} as valid YAML with:

    plaintext, html and recipient values.

    The environment should have $GMAIL_USER, $GM_APPWRD and $SUBJECT_LINE

    The plaintext and html values in {email_config} must be filenames
    containing the plaintext and html body content of the email

    GMAIL_USER and GM_APPWRD are expected to be
    the gmail sender and their app password.

    NOTE This program is usually executed by bin/run_local.sh

    """)


def validate_file_exists(file_path, description):
    """Check if a file exists and is readable."""
    if not os.path.isfile(file_path):
        print(f"Error: {description} file does not exist: {file_path}")
        sys.exit(1)
    if not os.access(file_path, os.R_OK):
        print(f"Error: {description} file is not readable: {file_path}")
        sys.exit(1)


def validate_string_value(value, description):
    """Check if a string value is not None or empty."""
    if not value or not value.strip():
        print(f"Error: {description} is missing or empty.")
        sys.exit(1)


# Validate environment variables
validate_string_value(subject_line, "Environment variable SUBJECT_LINE")
validate_string_value(gmail_password, "Environment variable GM_APPWRD")
validate_string_value(gmail_user, "Environment variable GMAIL_USER")

# Load YAML configuration
try:
    with open(email_config, 'r') as file:
        config = yaml.safe_load(file)
except FileNotFoundError:
    print(f"Error: {email_config} file not found.")
    usage()
    sys.exit(1)
except yaml.YAMLError as e:
    print(f"Error: Invalid {email_config}: {e}")
    usage()
    sys.exit(1)

# Validate YAML values
required_keys = ['plaintext', 'html', 'recipient']
for key in required_keys:
    if key not in config:
        print(f"Error: Missing required key in {email_config}: {key}")
        sys.exit(1)

validate_string_value(config['recipient'], "Recipient email in YAML")

# Validate file paths in YAML
validate_file_exists(config['plaintext'], "Plaintext email body")
validate_file_exists(config['html'], "HTML email body")

# Read email content from files
try:
    with open(config['plaintext'], 'r') as file:
        plaintext_content = file.read()
except IOError as e:
    print(f"Error: Failed to read plaintext file: {e}")
    sys.exit(1)

try:
    with open(config['html'], 'r') as file:
        html_content = file.read()
except IOError as e:
    print(f"Error: Failed to read HTML file: {e}")
    sys.exit(1)

# Set up the email
sender_email = gmail_user
receiver_email = config['recipient']

msg = MIMEMultipart('alternative')
msg['Subject'] = subject_line
msg['From'] = from_line
msg['To'] = receiver_email

# Attach both plaintext and HTML versions
part1 = MIMEText(plaintext_content, 'plain')
part2 = MIMEText(html_content, 'html')

msg.attach(part1)
msg.attach(part2)

# Send the email
try:
    with smtplib.SMTP('smtp.gmail.com', 587) as server:
        server.starttls()  # Upgrade the connection to secure
        server.login(sender_email, gmail_password)
        server.sendmail(sender_email, receiver_email, msg.as_string())
    print("Email sent successfully!")
except smtplib.SMTPAuthenticationError:
    print("Error: Gmail Auth failed. Check email and password.")
    sys.exit(1)
except smtplib.SMTPException as e:
    print(f"Error: Failed to send email: {e}")
    sys.exit(1)
except Exception as e:
    print(f"Unexpected error: {e}")
    sys.exit(1)

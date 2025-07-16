#!/bin/bash

echo "Starting cleanup process..."

if [ -f "$GITHUB_ENV" ]; then
    echo "Removing $GITHUB_ENV..."
    rm "$GITHUB_ENV"
    if [ $? -eq 0 ]; then
        echo "Successfully removed $GITHUB_ENV"
    else
        echo "Failed to remove $GITHUB_ENV, please check permissions."
        exit 1
    fi
else
    echo "$GITHUB_ENV not found, skipping removal."
fi

if [ -f "$GITHUB_STEP_SUMMARY" ]; then
    echo "Removing $GITHUB_STEP_SUMMARY..."
    rm "$GITHUB_STEP_SUMMARY"
    if [ $? -eq 0 ]; then
        echo "Successfully removed $GITHUB_STEP_SUMMARY"
    else
        echo "Failed to remove $GITHUB_STEP_SUMMARY, please check permissions."
        exit 1
    fi
else
    echo "$GITHUB_STEP_SUMMARY not found, skipping removal."
fi

echo "Cleanup process completed successfully."

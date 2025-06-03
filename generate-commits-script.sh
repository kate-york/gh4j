#!/bin/bash
# Check if a maximum commit number is provided as an argument
if [ -z "$1" ]; then
  max_commits=100  # Default to 100 if no argument is provided
else
  max_commits=$1   # Use the provided argument as the maximum commit number
fi
# Ensure the argument is a valid positive integer
if ! [[ "$max_commits" =~ ^[0-9]+$ ]] || [ "$max_commits" -le 0 ]; then
  echo "Error: Please provide a valid positive integer as the maximum commit number."
  exit 1
fi
# Loop through commit numbers from 1 to the max_commits
for commit_number in $(seq 1 "$max_commits")
do
  # Append the new line to README.md
  echo "- commit $commit_number" >> README.md
  # Add the changes to the git staging area
  git add README.md
  # Commit the changes with the appropriate message
  git commit -m "GIT-6 commit $commit_number"
  # Output the progress
  echo "Added and committed: - commit $commit_number"
done
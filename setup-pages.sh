#!/usr/bin/env bash
set -euo pipefail

echo ""
echo "Mathonsi Tech Creations - GitHub Pages setup"
echo "============================================"
echo ""

if [ ! -d ".git" ]; then
  echo "ERROR: This folder is not a Git repository."
  echo "Open Git Bash in your GitHub repository folder and run this script again."
  exit 1
fi

for file in index.html styles.css script.js .github/workflows/deploy-pages.yml; do
  if [ ! -f "$file" ]; then
    echo "ERROR: Required file missing: $file"
    exit 1
  fi
done

touch .nojekyll

current_branch="$(git branch --show-current)"
if [ "$current_branch" != "main" ]; then
  echo "Switching from $current_branch to main..."
  git checkout main
fi

echo ""
echo "Website files verified."
git status --short

git add index.html styles.css script.js README.md .nojekyll .github/workflows/deploy-pages.yml DEPLOYMENT.md

if git diff --cached --quiet; then
  echo "No new changes to commit."
else
  git commit -m "fix: configure static site for GitHub Pages deployment"
fi

git push origin main

echo ""
echo "Deployment files pushed."
echo "Now go to GitHub -> Settings -> Pages and set Source to GitHub Actions."
echo "Then check the Actions tab for the deployment result."

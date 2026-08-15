# Mathonsi Tech Creations — GitHub Pages Deployment

This package is arranged for direct GitHub Pages deployment.

## Required repository-root structure

```text
index.html
styles.css
script.js
.nojekyll
.github/workflows/deploy-pages.yml
```

Do not place `index.html` inside another folder.

## Git Bash setup

Copy all files from this package into the root of your GitHub repository, then run:

```bash
bash setup-pages.sh
```

The script verifies the website, stages the required files, commits the GitHub Pages configuration, and pushes `main`.

After the push:

1. Open the repository on GitHub.
2. Go to **Settings → Pages**.
3. Set **Build and deployment → Source** to **GitHub Actions**.
4. Open **Actions** and confirm that the Pages deployment succeeds.

If you still receive a 404, verify that `index.html` appears directly on the repository's main page and not inside a subfolder.

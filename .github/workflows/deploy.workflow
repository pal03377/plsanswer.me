name: deploy
on:
  push:
    branches:
      - main
jobs:
  build-and-deploy:
    name: Deploy to GitHub Pages
    concurrency: ci-${{ github.ref }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@v2

      - name: Install and Build 🔧
        run: |
          cd main
          npm ci
          npm run build

      - name: Deploy 🚀
        uses: JamesIves/github-pages-deploy-action@v4.2.2
        with:
          branch: gh-pages
          folder: main/build
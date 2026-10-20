# Reproducibility, Transparency, and Data Ethics

*How and when to share data, and when not to.*

How do you create transparency and credibility when you cannot share the data you use? What kind of data can you share? We discuss strategies for data collection, data use, and data sharing. This is relevant if you collect your own data, or if you use confidential data.

Slides are derived from the [Reproducibility curriculum](https://github.com/labordynamicsinstitute/reproducibility-curriculum) module `modules/12-reproducibility-ethics.qmd`.

## Follow along

- Slides: <https://labordynamicsinstitute.github.io/reproducibility-ethics/>
- PDF: <https://labordynamicsinstitute.github.io/reproducibility-ethics/presentation.pdf>

## Structure

- `presentation/index.qmd` -- Quarto revealjs driver; includes the slide fragments below
- `presentation/NN-*.md` -- slide fragments, in order
- `99-links.md` -- source and license slide

## Rendering

```bash
./presentation/render_presentation.sh   # renders to _html/presentation/
```

R dependencies are managed with `renv` (`renv.lock`, pinned to the 2024-10-30 CRAN snapshot that matches `rocker/verse:4.4.1`).

### Container

The `Dockerfile` builds a repo-specific image on top of `rocker/verse:4.4.1`, restoring `renv.lock` into the site library via `libraries.R` (idempotent: already-installed packages are skipped).

```bash
cd presentation && ./build.sh latest     # builds ghcr.io/labordynamicsinstitute/reproducibility-ethics:latest
./run-interactive.sh                     # RStudio on port 8787 using that image
```

To update packages: change the code, then inside the container run `renv::snapshot()`, and rebuild.

### GitHub Actions

`.github/workflows/compile-presentation.yml`:

1. builds the image (layer-cached; only slow when `Dockerfile`, `renv.lock`, or `libraries.R` change) and pushes it to GHCR,
2. renders the slides inside that image,
3. creates a PDF with decktape,
4. deploys both to GitHub Pages on every push to `main`.

Enable Pages with "GitHub Actions" as the source.

## License

[CC BY-NC 4.0](LICENSE)

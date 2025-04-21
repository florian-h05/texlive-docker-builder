# TeX Live Docker Builder

This repository provides a minimal (as small as possible) Docker image to build LaTeX slides with TeX Live.
The image also contains [minted](https://ctan.org/pkg/minted) for source code highlighting, [PlantUML](https://plantuml.com/) for UML diagrams, Inkscape for processing images and `make` as well as `latexmk` as build system.

PlantUML is available under the `plantuml` command.

This container image has been created for building tutorial slides in computer science lectures at the [Karlsruhe Institute of Technology](https://www.kit.edu).

## Usage

To build locally with make, run:

```shell
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/florian-h05/texlive-docker-builder:main make
```

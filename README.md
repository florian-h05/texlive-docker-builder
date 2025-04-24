# TeX Live Docker Builder

This repository provides a minimal (as small as possible) Docker image to build LaTeX slides with TeX Live.
The image also contains [minted](https://ctan.org/pkg/minted) for source code highlighting, [PlantUML](https://plantuml.com/) for UML diagrams, Inkscape for processing images and `make` as well as `latexmk` as build system.

PlantUML is available under the `plantuml` command.

This container image has been created for building tutorial slides in computer science lectures at the [Karlsruhe Institute of Technology](https://www.kit.edu).

## Usage

To build locally with make, run:

```shell
 docker run --rm -v $(pwd):/workspace -e PUID=$(id -u) -e PGID=$(id -g) ghcr.io/florian-h05/texlive-docker-builder make
```

To build on GitHub actions, you can add a job like the following:

```yaml
  build-slides:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/florian-h05/texlive-docker-builder
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      # make options:
      #   - build in parallel (-j)
      #   - don't abort build on errors/ignore errors (-i)
      - name: Build slides
        run: make -ij
    
      - name: Upload slides
        uses: actions/upload-artifact@v4
        with:
          name: slides
          path: |
            SPECIFY PATH(S) HERE
```


<!-- README.md is generated from README.Rmd. Please edit that file -->

# nettskjemar <img src='man/figures/logo.png' align="right" height="138.5" />

<!-- badges: start -->

[![R build
status](https://github.com/LCBC-UiO/nettskjemar/workflows/R-CMD-check/badge.svg)](https://github.com/LCBC-UiO/nettskjemar/actions)
[![DOI](https://zenodo.org/badge/206264675.svg)](https://zenodo.org/badge/latestdoi/206264675)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![CRAN
status](https://www.r-pkg.org/badges/version/nettskjemar)](https://CRAN.R-project.org/package=nettskjemar)
<!-- badges: end -->

The goal of {nettskjemar} is to have easy access to data and form
information on the [Nettskjema](https://nettskjema.no/) service by the
[University of Oslo, Norway](https://www.uio.no/english/). Currently the
main possibilities is help in creating users and tokens for accessing
Nettskjema through its API, downloading meta-data and codebooks about
specific forms and data associated with a specific form.

Install the released version from CRAN with:

``` r
install.packages("nettskjemar")
```

Newer releases can be installed through the authors r-universe:

``` r
# Enable this universe
options(repos = c(
    athanasiamo = 'https://athanasiamo.r-universe.dev',
    CRAN = 'https://cloud.r-project.org'))

# Install some packages
install.packages('nettskjemar')
```

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("LCBC-UiO/nettskjemar")
```

## Setting up the authentication

There is a tutorial on [how to create the API access user and
token](https://lcbc-uio.github.io/nettskjemar/articles/auth_setup.html)
needed to work with the api. This will need to be completed before you
can access any other features of this package.

## Example

Currently, the package contains functions to download data from forms,
including submission answers, meta-data and codebook information. The
most important, is the function that will download nettskjema submission
data and return them as a tibble (data.frame). This needs only the *id*
of a nettskjema, which can be found in the last part of the nettskjema
url.

``` r
library(nettskjemar)

nettskjema_get_data(nettskjema_id)
```

If you do not have the codebook activated, or you want to use the full
answers to questions rather than the coded ones, you can toggle off code
book answers:

``` r
nettskjema_get_data(nettskjema_id, use_codebook = FALSE)
```

## Documentation

Package documentation can be found on the associated [GitHub
pages](https://lcbc-uio.github.io/nettskjemar/), among other
documentation on [how to create the API acces user and
token](https://lcbc-uio.github.io/nettskjemar/articles/auth_setup.html).

# Funding

This tool is partly funded by:

**EU Horizon 2020 Grant:** Healthy minds 0-100 years: Optimising the use
of European brain imaging cohorts (Lifebrain).

**Grant agreement number:** 732592.

**Call:** Societal challenges: Health, demographic change and well-being

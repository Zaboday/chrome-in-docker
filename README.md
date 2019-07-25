<p align="center">
  <img src="https://hsto.org/webt/dh/_1/gt/dh_1gtk1oi2ootq5laqsgmj8nfy.png" width="80" alt="chrome">
</p>

# Docker image with Google Chrome

[![Build][badge_automated]][link_hub]
[![Build][badge_build]][link_hub]
[![Docker Pulls][badge_pulls]][link_hub]
[![Issues][badge_issues]][link_issues]
[![License][badge_license]][link_license]

### What is this?

This is a docker image, built for running `browser` tests.

This image includes:

- `supervisor`
- `xfonts`
- `chromedriver`
- `google-chrome-stable`
- `xvfb`

## Supported tags

Tag name | Details | Full image name  | Dockerfile
:------: | :-----: | :--------------: | :--------:
`latest` | ![Size][badge_size_latest] | `512k/chrome-in-docker` | [link][dockerfile_latest]

[badge_size_latest]:https://images.microbadger.com/badges/image/512k/chrome-in-docker:latest.svg
[dockerfile_latest]:https://github.com/512k/chrome-in-docker/blob/image-latest/Dockerfile

## Allowed environment variables

`slack-cli` allows to use next environment variables:

Variable name       | Description           | Example
------------------- | --------------------- | ----
`SCREEN_WIDTH`      | Screen width          | 1440
`SCREEN_HEIGHT`     | Screen height         | 900
`CHROMEDRIVER_PORT` | Chrome driver port    | 9515
`START_TIMEOUT`     | Browser start timeout | 15
`DISPLAY_NUM`       | Display number        | 10
`SCREEN_NUM`        | Screen number         | 0

### License

MIT. Use anywhere for your pleasure.

[badge_automated]:https://img.shields.io/docker/cloud/automated/512k/chrome-in-docker.svg?style=flat-square&maxAge=30
[badge_pulls]:https://img.shields.io/docker/pulls/512k/chrome-in-docker.svg?style=flat-square&maxAge=30
[badge_issues]:https://img.shields.io/github/issues/512k/chrome-in-docker.svg?style=flat-square&maxAge=30
[badge_build]:https://img.shields.io/docker/cloud/build/512k/chrome-in-docker.svg?style=flat-square&maxAge=30
[badge_license]:https://img.shields.io/github/license/512k/chrome-in-docker.svg?style=flat-square&maxAge=30
[link_hub]:https://hub.docker.com/r/512k/chrome-in-docker/
[link_license]:https://github.com/512k/chrome-in-docker/blob/master/LICENSE
[link_issues]:https://github.com/512k/chrome-in-docker/issues

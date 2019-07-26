<p align="center">
  <img src="https://hsto.org/webt/dh/_1/gt/dh_1gtk1oi2ootq5laqsgmj8nfy.png" width="80" alt="chrome">
</p>

# Docker image with Google Chrome

[![Build][badge_automated]][link_hub]
[![Build][badge_build]][link_hub]
[![Docker Pulls][badge_pulls]][link_hub]
[![Issues][badge_issues]][link_issues]
[![License][badge_license]][link_license]

## What is this?

This is a docker image, built for running `browser` tests.

This image includes:

- `supervisor`
- `xfonts`
- `chromedriver`
- `google-chrome-stable`
- `xvfb`

## Supported tags

Tag name | Details                    | Full image name                | Dockerfile
:------: | :------------------------: | :----------------------------: | :-----------------------:
`latest` | ![Size][badge_size_latest] | `512k/chrome-in-docker:latest` | [link][dockerfile_latest]
`75`     | ![Size][badge_size_75]     | `512k/chrome-in-docker:75`     | [link][dockerfile_75]
`74`     | ![Size][badge_size_74]     | `512k/chrome-in-docker:74`     | [link][dockerfile_74]
`73`     | ![Size][badge_size_73]     | `512k/chrome-in-docker:73`     | [link][dockerfile_73]
`72`     | ![Size][badge_size_72]     | `512k/chrome-in-docker:72`     | [link][dockerfile_72]
`71`     | ![Size][badge_size_71]     | `512k/chrome-in-docker:71`     | [link][dockerfile_71]
`70`     | ![Size][badge_size_70]     | `512k/chrome-in-docker:70`     | [link][dockerfile_70]

[badge_size_latest]:https://images.microbadger.com/badges/image/512k/chrome-in-docker:latest.svg
[badge_size_75]:https://images.microbadger.com/badges/image/512k/chrome-in-docker:75.svg
[badge_size_74]:https://images.microbadger.com/badges/image/512k/chrome-in-docker:74.svg
[badge_size_73]:https://images.microbadger.com/badges/image/512k/chrome-in-docker:73.svg
[badge_size_72]:https://images.microbadger.com/badges/image/512k/chrome-in-docker:72.svg
[badge_size_71]:https://images.microbadger.com/badges/image/512k/chrome-in-docker:71.svg
[badge_size_70]:https://images.microbadger.com/badges/image/512k/chrome-in-docker:70.svg
[dockerfile_latest]:https://github.com/512k/chrome-in-docker/blob/image-latest/Dockerfile
[dockerfile_75]:https://github.com/512k/chrome-in-docker/blob/image-75/Dockerfile
[dockerfile_74]:https://github.com/512k/chrome-in-docker/blob/image-74/Dockerfile
[dockerfile_73]:https://github.com/512k/chrome-in-docker/blob/image-73/Dockerfile
[dockerfile_72]:https://github.com/512k/chrome-in-docker/blob/image-72/Dockerfile
[dockerfile_71]:https://github.com/512k/chrome-in-docker/blob/image-71/Dockerfile
[dockerfile_70]:https://github.com/512k/chrome-in-docker/blob/image-70/Dockerfile

> **Note**: [`laravel/dusk`][link_dusk] version `^3.0` successfully tested with tags `73` and `74`. `laravel/dusk` versions `^4.0` and `^5.0` require chrome version between `70` and `73`.

## Allowed environment variables

Variable name       | Description           | Example
------------------- | --------------------- | -------
`SCREEN_WIDTH`      | Screen width          | `1440`
`SCREEN_HEIGHT`     | Screen height         | `900`
`CHROMEDRIVER_PORT` | Chrome driver port    | `9515`
`START_TIMEOUT`     | Browser start timeout | `15`
`DISPLAY_NUM`       | Display number        | `10`
`SCREEN_NUM`        | Screen number         | `0`

## Usage example

Using `docker-compose`:

```yaml
version: '3.2'

networks:
  app-network:
    driver: bridge

services:
  selenium:
    image: 512k/chrome-in-docker:latest
    restart: on-failure
    environment:
      SCREEN_WIDTH: 1440
      SCREEN_HEIGHT: 900
      CHROMEDRIVER_PORT: 9515
      START_TIMEOUT: 15
    ports:
      - 9515
    networks:
      - app-network
```

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
[link_dusk]:https://github.com/laravel/dusk

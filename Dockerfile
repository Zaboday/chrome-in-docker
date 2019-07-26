FROM debian:jessie-slim
LABEL Description="Container with Google Chrome" Vendor="512k"

# Get latest 74.* chromedriver version here: <https://chromedriver.storage.googleapis.com/LATEST_RELEASE_74>
# Google Chrome package: <https://github.com/webnicer/chrome-downloads/tree/master/x64.deb>

ENV \
  CHROMEDRIVER_VERSION="74.0.3729.6" \
  CHROME_VERSION="74.0.3729.169-1"

RUN set -xe \
  && apt-get update \
  && apt-get -yq install --no-install-recommends \
    supervisor \
    xvfb gconf2 \
    curl unzip \
    ca-certificates \
    fonts-ipafont-gothic xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable \
  && mkdir -p /opt/chromedriver-${CHROMEDRIVER_VERSION} \
  && curl -sS -o /tmp/chromedriver_linux64.zip \
    http://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip \
  && unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-${CHROMEDRIVER_VERSION} \
  && rm /tmp/chromedriver_linux64.zip \
  && chmod +x /opt/chromedriver-${CHROMEDRIVER_VERSION}/chromedriver \
  && ln -fs /opt/chromedriver-${CHROMEDRIVER_VERSION}/chromedriver /usr/local/bin/chromedriver \
  && curl -S -o /tmp/google-chrome.deb \
    https://raw.githubusercontent.com/webnicer/chrome-downloads/master/x64.deb/google-chrome-stable_${CHROME_VERSION}_amd64.deb \
  && apt-get -yq install \
    x11vnc \
    fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 \
    libgdk-pixbuf2.0-0 libnspr4 libnss3 lsb-release wget xdg-utils \
  && dpkg -i /tmp/google-chrome.deb \
  && apt-get -yq clean \
  && rm -f /tmp/google-chrome.deb \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./etc/xvfb.init.sh /etc/init.d/xvfb
COPY ./configs/supervisord.conf /etc/supervisor/supervisord.conf
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN set -xe \
  && supervisord -v \
  && google-chrome-stable --version \
  && chromedriver -v

EXPOSE 9515

ENTRYPOINT ["/docker-entrypoint.sh"]

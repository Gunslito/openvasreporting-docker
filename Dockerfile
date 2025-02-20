FROM python:3.14-rc-alpine3.21

WORKDIR /app

RUN apk update && apk add --no-cache \
    git \
    build-base \
    libxml2-dev \
    libxslt-dev \
    jpeg-dev

COPY src /app/

RUN pip install --upgrade pip && \
    pip install --upgrade build pyyaml defusedxml

RUN python3 -m build
RUN pip install dist/openvasreporting-*.whl

ENTRYPOINT ["openvasreporting"]
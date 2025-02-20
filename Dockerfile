FROM python:3.13.2-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY src /app/

WORKDIR /app/

RUN pip install --upgrade pip && \
    pip install --upgrade build pyyaml defusedxml

RUN python3 -m build
RUN pip install dist/openvasreporting-*.whl

ENTRYPOINT ["openvasreporting"]
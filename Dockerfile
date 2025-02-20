FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Gunslito/openvasreporting-docker.git

WORKDIR /app/src/openvasreporting

RUN pip install --upgrade pip && \
    pip install --upgrade build pyyaml defusedxml

RUN python3 -m build
RUN pip install dist/openvasreporting-*.whl

ENTRYPOINT ["openvasreporting"]
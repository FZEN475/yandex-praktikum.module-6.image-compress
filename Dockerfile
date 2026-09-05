FROM python:3.13-slim@sha256:9d2e5553305c7c7b0097999bb17187c69b921ccd6bc9d40e4bb5ebe652c00285

ARG DEFAULT_COMPRESS_RATIO=5
ARG DEFAULT_IMAGE_PATH=/tmp

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    COMPRESS_RATIO=${DEFAULT_COMPRESS_RATIO} \
    IMAGE_PATH=${DEFAULT_IMAGE_PATH}

RUN useradd -u 10001 --create-home --home-dir /app --shell /usr/sbin/nologin appuser

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=appuser:appuser server.py .

USER appuser

EXPOSE 18080

CMD ["python", "/app/server.py"]
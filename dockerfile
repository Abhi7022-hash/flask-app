# Stage 1: Build dependencies
FROM python:3.11-slim AS py
WORKDIR /APP
COPY requirements.txt ./
RUN pip install --user -r requirements.txt

# Stage 2: Final container
FROM python:3.11-slim
WORKDIR /app
COPY --from=py /root/.local /root/.local
COPY app ./app
ENV PATH=/root/.local/bin:$PATH
CMD ["gunicorn", "--chdir", "app", "main:app", "--bind", "0.0.0.0:5000"]

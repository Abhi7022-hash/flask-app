#stage1
FROM python:3.11-slim as py
WORKDIR /APP
COPY requirements.txt
RUN pip install --user -r  requirements.txt
#stage2
FROM python:3.11-slim
WORKDIR /app
COPY --from=py /root/.local/root/.local
COPTY /app .app/
ENV PATH = /root/.local/bin:$PATH
CMD ["gunicorn" , "--chdir" , "app" , "main:app" , "--bind" , "0.0.0.5000"]

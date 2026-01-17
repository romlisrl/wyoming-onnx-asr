FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt /app
COPY wyoming_onnxasr /app/wyoming_onnxasr

RUN pip install -r /app/requirements.txt \
    && sed -i 's/\r$//' /app/wyoming_onnxasr/__main__.py

EXPOSE 10305

ENTRYPOINT ["python3", "-m", "wyoming_onnxasr"]
CMD ["--model", "gigaam-v2-ctc", "--uri", "tcp://0.0.0.0:10305"]

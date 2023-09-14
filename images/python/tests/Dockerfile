ARG IMAGE_NAME

FROM ${IMAGE_NAME}

WORKDIR /app

COPY . .

USER root

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "-m", "flask", "--app", "/app/hello.py", "run", "--host", "0.0.0.0"]

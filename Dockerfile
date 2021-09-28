# pull the official base image
FROM python:3.8

# set work directory
# WORKDIR /final_project

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH=”$VIRTUAL_ENV/bin:$PATH”


# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# ENV SECRET_KEY=test
# ENV SENTRY_DSN=https://31b93fbf21624a8ea32e27b9ee5da6d1@o1009246.ingest.sentry.io/5979117
ENV PORT=8000

# copy project
COPY . .

# install dependencies
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt

EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
CMD python3 manage.py runserver 0.0.0.0:$PORT

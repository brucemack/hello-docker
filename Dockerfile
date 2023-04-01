FROM python:3.11.2-slim-bullseye

# Setup virtual environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
# Install dependencies:
COPY requirements.txt .
# The pip command is controlled by PATH (so uses venv)
RUN pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY main.py .
# The uvicorn command is controller by PATH (so uses venv)
CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80" ]

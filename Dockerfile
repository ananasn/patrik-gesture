# docker run -it --rm --network host gestures:1.0

FROM python:3.11-slim

WORKDIR /gestures
COPY requirements.txt ./

RUN    pip install pip --upgrade \
    && pip install --no-cache-dir -r requirements.txt \
    && pip uninstall opencv-contrib-python -y \
    && pip install opencv-python-headless
COPY . .    
CMD [ "hypercorn", "main:app", "--bind", "0.0.0.0:8008" ]

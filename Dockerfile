FROM nvcr.io/nvidia/pytorch:22.11-py3

# Update image
RUN apt update
RUN mkdir -p /app
WORKDIR /app
RUN git clone --recurse-submodules https://github.com/nadeembinshajahan/thermaltrack.git /app
# Install pip packages
COPY requirements.txt .
RUN python -m pip install --upgrade pip setuptools wheel
RUN pip install --no-cache -r requirements.txt

# Create working directory


COPY tii_final.yml .
RUN conda env create -f tii_final.yml
RUN conda activate tii_final

COPY main.py .
CMD ["python3", "main.py", "--yolo-weights", "weights/best.pt", "--img", "640", "--source", "/mounted_folder", "--save-txt" ]

VOLUME ["/mounted_folder"]
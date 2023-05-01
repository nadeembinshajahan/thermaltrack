# Real-time multi-object tracking and segmentation using Yolov5 with StrongSORT and OSNet

## Use without Docker
Clone the repo, change directory and install pip requirements
'''
git clone --recurse-submodules https://github.com/nadeembinshajahan/thermaltrack.git
cd thermaltrack
pip3 install -r requirements.txt
'''

To run the program:
'''
python3 main.py --yolo-weights weights/best.pt --img 640 --source img/ --save-txt --tracking-method strongsort --save-txt
'''
"/img" is the image directory.

After execution, it will generate a result.json

## Use with Docker
Clone the repo, change directory:

'''
git clone --recurse-submodules https://github.com/nadeembinshajahan/thermaltrack.git
cd thermaltrack
'''

Build docker image using:

'''
docker build -t tii_tracking .
'''

Once it is done building, you can replaced '/img' to provide the directory with the images to be inferred and provide a directory for the container to write the result.json file by replacing '/home/nadeem/tii' 

The following command starts the execution and inference:


'''
docker run -v /img:/mounted_folder -v /home/nadeem/tii:/app/output tii_tracking
'''

##Note

Docker method may not take full advantage of GPU. 
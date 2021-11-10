FROM jupyter/scipy-notebook

RUN mkdir my-model
ENV MODEL_DIR=/home/jovyan/my-model
ENV MODEL_FILE_LDA=clf_lda.joblib
ENV MODEL_FILE_NN=clf_nn.joblib

RUN pip install joblib

COPY train.csv ./train.csv
COPY test.csv ./test.csv

COPY train.py ./train.py
COPY inference.py ./inference.py

COPY train-api.py ./train-api.py
COPY inference-api.py ./inference-api.py

COPY ./requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

RUN python3 train.py


FROM python:3-slim-buster

RUN pip3 install --upgrade pip

ENV USER botx
ENV HOME /home/$USER
ENV BOT $HOME/terabox

RUN useradd -m $USER
RUN mkdir -p $BOT
RUN mkdir /home/botx/terabox/downloads/
RUN chown $USER:$USER $BOT
RUN chown $USER:$USER /home/botx/terabox/downloads/
USER $USER
WORKDIR $BOT

COPY requirements.txt requirements.txt
RUN pip3 install --user --no-cache-dir -r requirements.txt

COPY . .

CMD python3 TeraboxBot.py

 FROM ubuntu:18.04

 RUN apt-get update && \
     apt-get install -y python3.7 python3-pip

 RUN useradd -m cdc2
 RUN chown -R cdc2:cdc2 /home/cdc2/

 COPY --chown=cdc2 . /home/cdc2/project/

 USER cdc2
 WORKDIR /home/cdc2/project/
 ENV PATH "$PATH:/home/cdc2/.local/bin"

 RUN echo $PATH
 RUN chmod +x ./execute_webapp.sh
 RUN cd /home/cdc2/project/ && \
     python3 -m pip install --upgrade pip && \
     pip3 install -r requirements.txt

 EXPOSE 5000 5005
 ENTRYPOINT ["./execute_webapp.sh"]
 

 









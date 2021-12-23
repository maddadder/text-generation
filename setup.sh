# to run locally
cd ~/git3/text-generation
python3 -m venv env
source env/bin/activate
pip install -r src/requirements.txt

cd src
#flask run --host=0.0.0.0 --port=8501
python app.py runserver 0.0.0.0:8502

# to run in docker
#  Install docker
#   To configure after 1st install
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    docker run hello-world
sudo apt install docker-compose
cd ~/git3/text-generation
docker-compose build
docker-compose up

#to clear everything in docker:
docker-compose down -v --rmi local
docker rm -vf $(docker ps -a -q)
docker rmi -f $(docker images -a -q)
docker system prune --all

# microk8s
#docker-compose build
#then see microk8/microk8.txt

### To deploy:
cd ~/git3/text-generation
docker-compose build
docker push localhost:32000/generate:1.0
microk8s helm3 install generate ./generate

#microk8s kubectl rollout restart deployment generate
#microk8s kubectl get all --all-namespaces

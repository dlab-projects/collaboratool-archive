# This doesn't actually enable port forwarding
vagrant ssh -c "docker run -p 127.0.0.1:8888:8888 -v /vagrant/LearnDataScience:/LearnDataScience -w /LearnDataScience/notebooks nitin/learn_data_science" -- -L 8888:localhost:8888

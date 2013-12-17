# This enables port forwarding to *all* interfaces
vagrant ssh -c "docker run -p 0.0.0.0:8888:8888 -v /vagrant/LearnDataScience:/LearnDataScience -w /LearnDataScience/notebooks nitin/learn_data_science"

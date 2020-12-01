1. First run the project inside sandbox
2. create Cluster 
3. build and run tekton through these steps:
4.	cd tekton-build
5.	make init
6.	make new-version
7.	make two secrets
8.	make docker-login
9.	make test
10. apply all microservices through the below command , then all microservices should be worked on pipeline 
11.	make apply /tab
12.	make list to display the piplines
13.	make run-allpipelines to run all piplines
14.	make de-allpipelines to delete them all
15.	k get all -n test to display the the runnig pods

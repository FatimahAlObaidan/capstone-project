.PHONY: service-role-gitclone apply-front-end init-tkn docker-login secret cart-logs front-end-log new-version apply-cart delete-cart apply-shipping delete-shipping apply-user delete-user apply-cata delete-cata apply-order delete-order 

init-tkn:
	sudo apt update 
	sudo apt install -y gnupg 
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA 
	echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|sudo tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list 
	sudo apt update  
	sudo apt install -y tektoncd-cli
new-version:
	kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.17.1/release.yaml
docker-login:
	docker login -u fatimahobaidan1
two-secrets:
	kubectl apply -f secret-git.yaml -f docker-secret.yaml -n test
secret:
	kubectl create secret generic fatimah-docker-hub-creds --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json --type=kubernetes.io/dockerconfigjson
service-role-gitclone:	
	kubectl create -f sa.yaml -f clusterRB.yaml -f clusterR.yaml -f volume.yaml -f git-clone.yaml -n test
delete-service-role-gitclone:
	kubectl delete -f sa.yaml -f clusterRB.yaml -f clusterR.yaml -f volume.yaml -f git-clone.yaml -n test
apply-front-end:
	kubectl apply -f front-end/front-end-task.yaml -f deploy/task-deploy/front-end-deploy-task.yaml -f front-end/front-end-run-pipline.yaml -n test 
	tkn pr logs -f front-end-pipeline-run -n test
delete-front-end:
	kubectl delete -f front-end/front-end-run-pipline.yaml -f front-end/front-end-task.yaml -n test
front-end-log:
	tkn pr logs -f front-end-pipeline-run
apply-cata:
	kubectl apply -f catalogue/catalogue-db-task.yaml -f catalogue/catalogue-task.yaml -f deploy/task-deploy/catalogue-deploy-task.yaml -f catalogue/catalogue-run-pipline.yaml -n test
delete-cata:
	kubectl delete -f catalogue/catalogue-db-task.yaml -f catalogue/catalogue-run-pipline.yaml -f catalogue/catalogue-task.yaml -n test
cata-logs:
	kubectl pr logs 
apply-user:
	kubectl apply -f user/user-db-task.yaml -f user/user-task.yaml -f deploy/task-deploy/user-deploy-task.yaml -f user/user-run-pipline.yaml -n test 
	tkn pr logs -f front-end-pipeline-run -n test
delete-user:
	kubectl delete -f user/user-db-task.yaml  -f user/user-run-pipline.yaml -f user/user-task.yaml -n test
apply-shipping:
	kubectl apply -f shipping/shipping-task.yaml -f deploy/task-deploy/shipping-deploy-task.yaml -f shipping/shipping-run-pipline.yaml -n test
	tkn pr logs -f shipping-pipeline-run -n test
delete-shipping:
	kubectl delete -f shipping/shipping-run-pipline.yaml  -f shipping/shipping-task.yaml -n test
apply-cart:
	kubectl apply -f carts/cart-task.yaml -f deploy/task-deploy/cart-deploy-task.yaml -f carts/cart-run-pipline.yaml -n test
	tkn pr logs -f cart-pipeline-run -n test
delete-cart:
	kubectl delete -f carts/cart-run-pipline.yaml  -f carts/cart-task.yaml -f deploy/task-deploy/cart-deploy-task.yaml -n test
apply-orders:
	kubectl apply -f orders/order-task.yaml -f deploy/task-deploy/order-deploy-task.yaml -f orders/order-run-pipline.yaml -n test
delete-order:
	kubectl delete -f orders/order-task.yaml -f orders/order-run-pipline.yaml -n test
apply-queue:
	kubectl apply -f queue-master/queue-task.yaml -f deploy/task-deploy/queue-deploy-task.yaml -f queue-master/queue-run-pipline.yaml -n test
	tkn pr logs -f queue-master-pipeline-run -n test
delete-que:
	kubectl delete -f queue-master/queue-task.yaml -f queue-master/queue-run-pipline.yaml -n test
apply-pay:
	kubectl apply -f payment/payment-task.yaml -f deploy/task-deploy/payment-deploy-task.yaml -f payment/payment-run-pipline.yaml -n test
	tkn pr logs -f payment-pipeline-run -n test
delte-pay:
	kubectl delete -f payment/payment-task.yaml -f payment/payment-run-pipline.yaml -n test
cart-logs:
	tkn pr logs -f cart-pipeline-run -n test
test:
	kubectl apply -f t-task/task-test1.yaml -n test 
#-f t-task/task-test.yaml 
de-allpipilines:
	tkn pr delete catalogue-pipeline-run user-pipeline-run payment-pipeline-run queue-master-pipeline-run shipping-pipeline-run order-pipeline-run cart-pipeline-run front-end-pipeline-run -n test
run-allpipilines:
	kubectl apply -f carts/cart-run-pipline.yaml -f front-end/front-end-run-pipline.yaml -f catalogue/catalogue-run-pipline.yaml -f payment/payment-run-pipline.yaml -f orders/order-run-pipline.yaml -f queue-master/queue-run-pipline.yaml -f shipping/shipping-run-pipline.yaml -f user/user-run-pipline.yaml -n test
list:
	tkn pr list -n test

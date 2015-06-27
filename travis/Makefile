BUILD=$(shell pwd)/.build
COMMON=$(shell pwd)/../common

default:
	rm -rf $(BUILD)
	mkdir -p $(BUILD)
	cp -aR $(COMMON) $(BUILD)
	cp Dockerfile.head  $(BUILD)/Dockerfile
	cat $(COMMON)/Dockerfile.tail >> $(BUILD)/Dockerfile
	sudo docker build -t shanegibbs/snowy-dev:travis $(BUILD)

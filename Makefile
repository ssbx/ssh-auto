.PHONY: install sshauto.source

SSHAUTO_USERNAME ?= "$(USER)"
SSHAUTO_HOSTS ?= "$(HOME)/.sshauto_hosts"
SSHPASS ?= "passwd"

install: sshauto.source 
	install -m 600 sshauto.source $(HOME)/.sshauto.source
	install -m 644 sshauto_hosts $(SSHAUTO_HOSTS)
	install -m 700 sshauto $(HOME)/bin
	rm sshauto.source

sshauto.source:
	cat sshauto.source.in \
		| sed s:@SSHAUTO_USERNAME@:$(SSHAUTO_USERNAME): \
		| sed s:@SSHAUTO_HOSTS@:$(SSHAUTO_HOSTS): \
		| sed s:@SSHPASS@:$(SSHPASS): > sshauto.source

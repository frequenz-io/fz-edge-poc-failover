.PHONY: install install-keepalived install-scripts

install: install-scripts install-keepalived

install-scripts:
	mkdir -p /opt/frequenz/failover/scripts
	cp scripts/*.sh /opt/frequenz/failover/scripts/
	chmod +x /opt/frequenz/failover/scripts/*.sh

install-keepalived:
	mkdir -p /etc/keepalived
	@if [ "$$(uname -m)" = "aarch64" ]; then \
		echo "Detected aarch64 architecture - installing master config"; \
		cp keepalive/keepalived_master.conf /etc/keepalived/keepalived.conf; \
	else \
		echo "Detected $$(uname -m) architecture - installing backup config"; \
		cp keepalive/keepalived_backup.conf /etc/keepalived/keepalived.conf; \
	fi




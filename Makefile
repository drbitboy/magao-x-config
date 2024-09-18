
DRIVER_COUNT ?= 3
CONFIG_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
SCRIPTS_DIR := $(abspath $(CONFIG_DIR)/scripts)

check:
	@[ -d "$(CONFIG_DIR)" ]
	@[ -d "$(SCRIPTS_DIR)" ]

all: clean check
	"$(SCRIPTS_DIR)"/00config_wrapper.bash $(DRIVER_COUNT)

clean: check
	$(RM) "$(CONFIG_DIR)"/*.conf "$(CONFIG_DIR)"/proclist_*.txt "$(CONFIG_DIR)"/proclist_*.txt.copy

logsclean: check
	$(RM) "$(CONFIG_DIR)"/../logs/*.binlog

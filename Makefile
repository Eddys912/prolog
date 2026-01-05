# Makefile for prolog-logic-fundamentals
# Documentation: https://www.gnu.org/software/make/manual/make.html
# Usage: make run <path/file.pl>

# Interpreter
PROLOG = swipl

# Flags -q: quiet, -t halt: exit after execution
PROLOG_FLAGS = -q -t halt

# Colors for the terminal
RED = \033[0;31m
GREEN = \033[0;32m
CYAN = \033[0;36m
NC = \033[0m

.PHONY: run help

run:
	@$(eval FILE := $(filter-out $@,$(MAKECMDGOALS)))
	@if [ ! -f $(FILE) ]; then \
		printf "$(RED)Error: File '$(FILE)' not found.$(NC)\n"; \
		exit 1; \
	fi

	@case "$(FILE)" in \
		*.pl) ;; \
		*) printf "$(RED)Error: '$(FILE)' is not a .pl file.$(NC)\n"; exit 1 ;; \
	esac

	@printf "$(CYAN)----- Executing Prolog: %s -----$(NC)\n" "$(FILE)"
	@$(PROLOG) $(PROLOG_FLAGS) -s $(FILE)

help:
	@printf "$(GREEN)Usage:$(NC) make run <path/file.pl>\n"
	@printf "$(GREEN)Example:$(NC) $(CYAN)make run exercises/01_animal_hierarchy.pl$(NC)\n"

%:
	@:

# Makefile for PACT Compliance Tests

# Configuration
SHELL := /bin/bash
TESTS_DIR := $(shell pwd)
SCRIPTS_DIR := $(TESTS_DIR)/scripts
LOGS_DIR := $(TESTS_DIR)/logs
RESULTS_DIR := $(TESTS_DIR)/results

# Ensure directories exist
$(shell mkdir -p $(LOGS_DIR) $(RESULTS_DIR))

# Default target
.PHONY: all
all: pact-tests

# Run all PACT tests
.PHONY: pact-tests
pact-tests: pact-tests-protocol pact-tests-memory pact-tests-state
	@echo "All PACT tests completed"
	@echo "Summary of test results:"
	@echo "-----------------------"
	@grep -h "Test completed with status" $(LOGS_DIR)/*.log | sort

# Protocol adherence tests
.PHONY: pact-tests-protocol
pact-tests-protocol: tool-call-protocol visual-indicator implementation-permission
	@echo "Protocol adherence tests completed"

# Memory consistency tests
.PHONY: pact-tests-memory
pact-tests-memory: entity-creation relationship-validation
	@echo "Memory consistency tests completed"

# State management tests
.PHONY: pact-tests-state
pact-tests-state: session-state interruption-recovery
	@echo "State management tests completed"

# Individual tests
.PHONY: tool-call-protocol
tool-call-protocol:
	@echo "Running Tool Call Protocol Test..."
	@chmod +x $(SCRIPTS_DIR)/test_tool_call_protocol.sh
	@$(SCRIPTS_DIR)/test_tool_call_protocol.sh

.PHONY: visual-indicator
visual-indicator:
	@echo "Running Visual Indicator Test..."
	@echo "Note: This test is not yet implemented" > $(LOGS_DIR)/visual_indicator_test.log
	@echo "Test not implemented yet"

.PHONY: implementation-permission
implementation-permission:
	@echo "Running Implementation Permission Test..."
	@echo "Note: This test is not yet implemented" > $(LOGS_DIR)/implementation_permission_test.log
	@echo "Test not implemented yet"

.PHONY: entity-creation
entity-creation:
	@echo "Running Entity Creation Test..."
	@echo "Note: This test is not yet implemented" > $(LOGS_DIR)/entity_creation_test.log
	@echo "Test not implemented yet"

.PHONY: relationship-validation
relationship-validation:
	@echo "Running Relationship Validation Test..."
	@echo "Note: This test is not yet implemented" > $(LOGS_DIR)/relationship_validation_test.log
	@echo "Test not implemented yet"

.PHONY: session-state
session-state:
	@echo "Running Session State Test..."
	@echo "Note: This test is not yet implemented" > $(LOGS_DIR)/session_state_test.log
	@echo "Test not implemented yet"

.PHONY: interruption-recovery
interruption-recovery:
	@echo "Running Interruption Recovery Test..."
	@echo "Note: This test is not yet implemented" > $(LOGS_DIR)/interruption_recovery_test.log
	@echo "Test not implemented yet"

# Clean test results and logs
.PHONY: clean
clean:
	@echo "Cleaning test results and logs..."
	@rm -f $(LOGS_DIR)/*.log $(RESULTS_DIR)/*.json
	@echo "Cleaned"

# Show help
.PHONY: help
help:
	@echo "PACT Compliance Test Suite"
	@echo "--------------------------"
	@echo "Available targets:"
	@echo "  all (default)            Run all tests"
	@echo "  pact-tests               Run all PACT tests"
	@echo "  pact-tests-protocol      Run protocol adherence tests"
	@echo "  pact-tests-memory        Run memory consistency tests"
	@echo "  pact-tests-state         Run state management tests"
	@echo "  tool-call-protocol       Run tool call protocol test"
	@echo "  visual-indicator         Run visual indicator test"
	@echo "  implementation-permission Run implementation permission test"
	@echo "  entity-creation          Run entity creation test"
	@echo "  relationship-validation  Run relationship validation test"
	@echo "  session-state            Run session state test"
	@echo "  interruption-recovery    Run interruption recovery test"
	@echo "  clean                    Clean test results and logs"
	@echo "  help                     Show this help message" 
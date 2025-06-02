# Makefile for PACT-S project

.PHONY: install-tools check-links check-links-recursive check-custom-links fix-link-format help create-missing-directories fix-readme-links fix-contributing-links fix-priority-links

# Default target
help:
	@echo "Available targets:"
	@echo "  install-tools       - Install required tools for link checking"
	@echo "  check-links         - Check standard markdown links in root markdown files"
	@echo "  check-links-recursive - Check standard links in ALL markdown files recursively"
	@echo "  check-custom-links  - Check custom formatted links in PACT-S (format: \`[./path/to/file](./path/to/file)\`)"
	@echo "  fix-link-format     - Fix non-standard link formatting using scripts/fix_markdown_links.sh"
	@echo "  create-missing-directories - Create directories commonly referenced but missing"
	@echo "  fix-readme-links    - Fix broken links in README.md"
	@echo "  fix-contributing-links - Fix broken links in CONTRIBUTING.md"
	@echo "  fix-priority-links  - Fix broken links in high-priority files (README.md, CONTRIBUTING.md)"

# Install required tools
install-tools:
	@echo "Installing markdown-link-check..."
	npm install -g markdown-link-check

# Check standard links in root markdown files
check-links:
	@echo "Checking standard links in root markdown files..."
	find . -maxdepth 1 -name "*.md" -type f -exec echo {} \; -exec markdown-link-check -q {} \;

# Check standard links recursively in all markdown files
check-links-recursive:
	@echo "Checking standard links in all markdown files recursively..."
	find . -name "*.md" -type f -exec echo {} \; -exec markdown-link-check -q {} \;

# Verbose version to see all standard links
check-links-verbose:
	@echo "Checking standard links in all markdown files recursively (verbose)..."
	find . -name "*.md" -type f -exec echo {} \; -exec markdown-link-check {} \;

# Check custom formatted links (format: `[./path/to/file](./path/to/file)`)
check-custom-links:
	@echo "Checking custom-formatted links in all markdown files..."
	@echo "Creating temporary link check script..."
	@mkdir -p .tmp
	@echo '#!/bin/bash' > .tmp/check_custom_links.sh
	@echo 'file=$$1' >> .tmp/check_custom_links.sh
	@echo 'echo "Checking $$file"' >> .tmp/check_custom_links.sh
	@echo 'links=$$(grep -o "\`\[.*\](.*)\`" "$$file" | sed -E "s/\`\[(.*)\]\((.*)\)\`/\2/g")' >> .tmp/check_custom_links.sh
	@echo 'if [ -z "$$links" ]; then' >> .tmp/check_custom_links.sh
	@echo '  echo "  No custom links found"' >> .tmp/check_custom_links.sh
	@echo '  exit 0' >> .tmp/check_custom_links.sh
	@echo 'fi' >> .tmp/check_custom_links.sh
	@echo 'basedir=$$(dirname "$$file")' >> .tmp/check_custom_links.sh
	@echo 'error_count=0' >> .tmp/check_custom_links.sh
	@echo 'for link in $$links; do' >> .tmp/check_custom_links.sh
	@echo '  # Handle relative paths' >> .tmp/check_custom_links.sh
	@echo '  if [[ $$link == ./* ]]; then' >> .tmp/check_custom_links.sh
	@echo '    # Remove leading ./' >> .tmp/check_custom_links.sh
	@echo '    link="$${link#./}"' >> .tmp/check_custom_links.sh
	@echo '  fi' >> .tmp/check_custom_links.sh
	@echo '  if [ -e "$$link" ]; then' >> .tmp/check_custom_links.sh
	@echo '    echo "  ✓ $$link"' >> .tmp/check_custom_links.sh
	@echo '  else' >> .tmp/check_custom_links.sh
	@echo '    echo "  ✗ $$link (File not found)"' >> .tmp/check_custom_links.sh
	@echo '    error_count=$$((error_count + 1))' >> .tmp/check_custom_links.sh
	@echo '  fi' >> .tmp/check_custom_links.sh
	@echo 'done' >> .tmp/check_custom_links.sh
	@echo 'if [ $$error_count -gt 0 ]; then' >> .tmp/check_custom_links.sh
	@echo '  echo "  Found $$error_count broken links"' >> .tmp/check_custom_links.sh
	@echo '  exit 1' >> .tmp/check_custom_links.sh
	@echo 'fi' >> .tmp/check_custom_links.sh
	@chmod +x .tmp/check_custom_links.sh
	@echo "Running custom link check..."
	@find . -name "*.md" -type f -exec .tmp/check_custom_links.sh {} \;

# Fix non-standard link formatting
fix-link-format:
	@echo "Fixing non-standard link format in all Markdown files..."
	@./scripts/fix_markdown_links.sh

# Create missing directories referenced in markdown files
create-missing-directories:
	@echo "Creating commonly referenced directories..."
	@mkdir -p docs/.assets/images docs/.assets/diagrams

# Fix broken links in README.md
fix-readme-links:
	@echo "Fixing broken links in README.md..."
	@mkdir -p .tmp
	@cat README.md > .tmp/README.md.bak
	@echo "Creating README.md link fix script..."
	@echo '#!/bin/bash' > .tmp/fix_readme_links.sh
	@echo '' >> .tmp/fix_readme_links.sh
	@echo '# Fix broken links in README.md' >> .tmp/fix_readme_links.sh
	@echo 'sed -i.bak \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./.plans/README.md|./docs/plans/README.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./docs/developer_guides/worktree_management_protocol.md|./protocols/development_workflow/worktree_management_protocol.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./plans/README.md|./docs/plans/README.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./tools/index.md|./tools/README.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./tools/examples/README.md|./tools/reference_implementations/README.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./protocols/mode_transition.md|./protocols/core_governance/mode_transition.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./protocols/permission_verification.md|./protocols/core_governance/permission_verification.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./protocols/implementation_permission.md|./protocols/core_governance/implementation_permission.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./protocols/tool_usage_protocol.md|./protocols/agent_tool_operation/tool_usage_protocol.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./protocols/pact_compliance_protocol.md|./protocols/core_governance/pact_compliance_protocol.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./protocols/response_tags.md|./protocols/communication_and_state/response_tags.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./protocols/state_reference_protocol.md|./protocols/communication_and_state/state_reference_protocol.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./.plans/development_roadmap_and_tasks.md|./docs/plans/development_roadmap_and_tasks.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./.plans/pacts_ontology_and_xml_workflow.md|./docs/plans/ontology_and_formalism/2_xml_xsd_workflow_plan.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./.plans/documentation_strategy.md|./docs/plans/documentation/README.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./.plans/vcs_strategy.md|./docs/plans/vcs_strategy.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./.plans/testing_strategy.md|./docs/plans/testing_and_verification/README.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  -e "s|./.plans/multi_repo_architecture_docs_plan.md|./docs/plans/future-research/multi_repo_architecture_docs_plan.md|g" \' >> .tmp/fix_readme_links.sh
	@echo '  README.md' >> .tmp/fix_readme_links.sh
	@chmod +x .tmp/fix_readme_links.sh
	@./.tmp/fix_readme_links.sh
	@echo "README.md links fixed. Original backed up to .tmp/README.md.bak"

# Fix broken links in CONTRIBUTING.md
fix-contributing-links:
	@echo "Fixing broken links in CONTRIBUTING.md..."
	@mkdir -p .tmp
	@cat CONTRIBUTING.md > .tmp/CONTRIBUTING.md.bak
	@echo "Creating CONTRIBUTING.md link fix script..."
	@echo '#!/bin/bash' > .tmp/fix_contributing_links.sh
	@echo '' >> .tmp/fix_contributing_links.sh
	@echo '# Fix broken links in CONTRIBUTING.md' >> .tmp/fix_contributing_links.sh
	@echo 'sed -i.bak \' >> .tmp/fix_contributing_links.sh
	@echo '  -e "s|./.plans/README.md|./docs/plans/README.md|g" \' >> .tmp/fix_contributing_links.sh
	@echo '  -e "s|./.plans/vcs_strategy.md|./docs/plans/vcs_strategy.md|g" \' >> .tmp/fix_contributing_links.sh
	@echo '  -e "s|./.plans/testing_strategy.md|./docs/plans/testing_and_verification/README.md|g" \' >> .tmp/fix_contributing_links.sh
	@echo '  -e "s|./.plans/documentation_strategy.md|./docs/plans/documentation/README.md|g" \' >> .tmp/fix_contributing_links.sh
	@echo '  -e "s|./.plans/documentation_alignment_plan.md|./docs/plans/archived_or_reference_materials/documentation_alignment_plan.md|g" \' >> .tmp/fix_contributing_links.sh
	@echo '  CONTRIBUTING.md' >> .tmp/fix_contributing_links.sh
	@chmod +x .tmp/fix_contributing_links.sh
	@./.tmp/fix_contributing_links.sh
	@echo "CONTRIBUTING.md links fixed. Original backed up to .tmp/CONTRIBUTING.md.bak"

# Fix links in high-priority files
fix-priority-links: fix-readme-links fix-contributing-links
	@echo "Fixed links in high-priority files." 
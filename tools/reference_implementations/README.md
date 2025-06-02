# PACT-System Reference Implementations for Tools

This directory is intended to house reference implementations, shims, or adaptors for various tools that can be integrated into the PACT-System. These implementations serve as concrete examples of how external tools can be made compliant with PACT-System protocols, particularly the [Tool Usage Protocol](../../protocols/tool_usage_protocol.md) and the [Symbolic Tool References Definition](../symbolic_tool_references.md).

## Purpose

*   **Guidance**: Provide developers with working examples of how to wrap or adapt existing tools for use within a PACT-System instance.
*   **Standardisation**: Promote a consistent approach to tool integration.
*   **Testability**: Offer concrete implementations that can be used for testing PACT-System's tool management capabilities.
*   **Rapid Prototyping**: Enable faster integration of common tools by providing ready-to-use or easily adaptable modules.

## Content

This directory might contain:

*   Wrapper scripts (e.g., Python, Bash) for command-line tools.
*   Client libraries or SDK adaptors for API-based services.
*   Stub implementations for demonstrating protocol adherence before a full tool integration is complete.
*   Configuration examples for specific tool integrations.
*   Documentation specific to each reference implementation, explaining its setup, usage, and any PACT-System specific considerations.

## Current Implementations

*(TODO: List actual reference implementations as they are developed. For example, a Python wrapper for a specific API, a shell script adaptor for a CLI tool, etc. This should be noted in the `master_project_plan.md`.)*

Each reference implementation should reside in its own subdirectory and include:
*   A `README.md` detailing the specific tool, its PACT-System integration, and how to use the reference implementation.
*   All necessary code and configuration files.

## Relation to Symbolic Tool References

The implementations here should correspond to, or provide concrete backends for, tool definitions found in the main [`tools/symbolic_tool_references.md`](../symbolic_tool_references.md) file. The symbolic reference defines *what* the tool is from the PACT-System's perspective, while the reference implementation shows *how* such a tool can be practically realised and interfaced. 
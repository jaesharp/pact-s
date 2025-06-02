# PACT-System Prompt Engineering Resources

This directory is dedicated to storing and managing prompt engineering resources for the PACT-System. This includes meta-prompts, prompt templates, few-shot examples, and guidelines for constructing effective prompts when interacting with Large Language Models (LLMs) or other AI components within the PACT-System framework.

## Purpose

*   **Standardisation**: Provide a central repository for reviewed and approved prompts to ensure consistency in AI agent behavior and communication style.
*   **Best Practices**: Capture and disseminate best practices in prompt engineering as they relate to PACT-System principles (e.g., ensuring clarity, eliciting verifiable responses).
*   **Reusability**: Offer a collection of reusable prompt components and templates that can be adapted for various tasks and scenarios.
*   **Guidance**: Serve as a reference for developers and operators on how to craft prompts that align with PACT-System goals, such as maintaining user consent and ensuring operational transparency.
*   **Version Control**: Allow for versioning and tracking changes to critical prompts used by the system.

## Content

This directory may contain:

*   **Meta-Prompts / System Prompts**: Base prompts that define the overall persona, constraints, and operational mode of an AI agent operating under PACT-System principles.
    *   Example: A master prompt that instructs an agent on how to adhere to all PACT-System protocols.
*   **Task-Specific Prompt Templates**: Templates for common tasks, such as summarization, code generation, tool invocation, or user clarification requests, designed to elicit PACT-System compliant responses.
*   **Few-Shot Example Sets**: Collections of input-output examples that demonstrate desired behavior for specific tasks, helping to guide LLM responses.
*   **Prompting Guides**: Documents outlining strategies for effective prompt construction, including how to incorporate PACT-System requirements (e.g., explicitly requesting permission checks, using defined [response tags](../protocols/response_tags.md)).
    *   See also: [`tools/deep_reasoning_models_prompting_guide.md`](../tools/deep_reasoning_models_prompting_guide.md)
*   **Negative Prompts / Constraints**: Examples of phrasing or instructions to avoid, or explicit constraints to include in prompts to prevent undesirable behaviors.

## Organisation

Prompts and related resources could be organised by:

*   The PACT-System component they relate to (e.g., `agent_core_prompts/`, `tool_interaction_prompts/`).
*   The task they are designed for (e.g., `summarization/`, `code_generation/`).
*   The AI model they are optimized for (if applicable and significant variations exist).

*(TODO: Define a more concrete organizational structure as prompt assets are developed. Consider if prompts should be stored in plain text, markdown, YAML, or another structured format. This should be noted in the `master_project_plan.md`.)*

## Integration

Prompts from this directory are intended to be loaded and utilized by PACT-System agents or applications that interact with LLMs. Mechanisms for referencing, loading, and versioning these prompts will be defined as part of the PACT-System's core implementation (see `src/README.md`). 
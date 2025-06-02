# Guide to Prompting Deep Reasoning Models (e.g., using `DEEPSEEK_THINKING`)

This guide provides comprehensive documentation for effectively using advanced "thinking" or "deep reasoning" models. These models, which might be accessed via symbolic references like `DEEPSEEK_THINKING` within the PACT-System framework, are designed for complex reasoning tasks where the reasoning process is largely internal.

## Overview and Capabilities

- **Symbolic Reference Example**: `DEEPSEEK_THINKING` (represents a category of deep reasoning tools).
- **Implementation Note**: A specific environment might map `DEEPSEEK_THINKING` to a particular engine (e.g., DeepSeek-R1 via an actual tool like `mcp_deep_reasoner_get_deepseek_thinker`). Always refer to `symbolic_tool_references.md` for the current mapping.
- **Purpose**: Provides enhanced reasoning capabilities for complex problem-solving, mathematical proofs, logic puzzles, code analysis, scientific reasoning, and multi-step problems (optimally 5+ steps for many such models).

## Core Prompting Principles for Deep Reasoning Models

These principles are crucial for maximizing the effectiveness of this class of models.

### DO:

*   ✅ **Use Minimal, Clear Prompts**: Keep instructions direct, concise, and in plain language. Clearly state what you want without unnecessary complexity or verbosity.
*   ✅ **Let the Model Think Independently**: Deep reasoning models typically perform extensive internal reasoning. Avoid explicit step-by-step instructions that might hinder their natural reasoning flow.
*   ✅ **Encourage More Reasoning for Complex Tasks**: For difficult problems, explicitly invite the model to take time. 
    *   *Example*: "This is a complex problem. Take your time to think through each aspect carefully."
*   ✅ **Use Delimiters for Clarity**: Structure your input with clear markers (e.g., XML tags, Markdown sections like `[Task: ...] Text: ...`) to help the model correctly interpret different parts of your request.
*   ✅ **Set Appropriate Temperature (if applicable)**: For models where temperature is a parameter, a recommended range is often 0.5-0.7 for some (like DeepSeek-R1) to prevent repetitive or incoherent responses. Consult specific model documentation.
*   ✅ **Chain-of-Draft (CoD) Prompting (Advanced)**: For reducing token usage while maintaining reasoning quality with certain models, consider CoD. This encourages minimal yet informative reasoning steps (typically 5 words or fewer per step).
    *   *Example System Prompt for CoD*: "Think step by step, but only keep a minimum draft for each thinking step, with 5 words at most."

### DON'T:

*   ❌ **Avoid Few-Shot Prompting (Generally)**: Unlike many traditional LLMs, some deep reasoning models (e.g., DeepSeek-R1) often perform worse with examples provided in the prompt. Zero-shot prompts (describing the task in detail without examples) tend to work better for this class of model.
    *   *Avoid*: "Example 1: Q: X? A: Y. Example 2: Q: Z? A: W. Now answer this: ..."
*   ❌ **Avoid Explicit Chain-of-Thought Directives**: Do not tell the model to "think step by step" or explain its reasoning explicitly, as the reasoning process is a core internal function of these models.
    *   *Avoid*: "Think step by step. First, consider X. Then, analyze Y. Finally, conclude Z."
*   ❌ **Don't Overload with Unnecessary Details/Context**: More context isn't always better for these models. Focus on providing only essential and relevant information. Excessive details can reduce accuracy.
*   ❌ **Avoid Using for Highly Structured Outputs (Typically)**: Deep reasoning models may struggle with generating highly structured outputs like JSON or complex tables. If such output is critical, consider a standard LLM or ensure clear delimiters and instructions are provided to guide consistency.
*   ❌ **Don't Use for Very Simple Tasks**: These models might "overthink" problems requiring fewer than 3 reasoning steps. Traditional LLMs might be more efficient for such tasks.
    *   *Avoid*: "What is 2+2?"

## Specific Use Cases & Prompting Examples

(These examples illustrate interactions with a deep reasoning model like DeepSeek-R1)

### 1. Mathematical Problems

*   State the problem clearly without breaking it down into intermediate steps yourself.
*   To guide the format of a concrete numerical answer, you can add: *"Please reason step by step, and put your final answer within \\boxed{}"*
*   Occasionally, to ensure deep thought, you might use: *"Start your response with the `<think>` tag"* (use sparingly).

    ```
    # Prompt Example for Mathematical Problem
    Calculate the sum of the infinite series: 1 + 1/4 + 1/9 + 1/16 + ...
    Please reason step by step, and put your final answer within \boxed{}.
    ```

### 2. Technical Troubleshooting / Code Analysis

*   Present the error message or issue directly without suggesting potential solutions or causes.
*   Include relevant code snippets or error logs.
*   Ask for an analysis of the cause and potential fixes.

    ```
    # Prompt Example for Technical Troubleshooting
    I received this error when using Z3 solver:
    "TypeError: unsupported operand type(s) for //: 'ArithRef' and 'int'"

    My code:
    ```python
    n = Int('n')
    formula = ((n * (n + 1)) // 2) ** 2
    ```

    What's causing this error and how should I fix it?
    ```

### 3. Multi-Step Complex Problems

*   Present the overall task or question clearly.
*   Do not break down the steps for the model; let it determine the reasoning path.
*   Especially effective for tasks requiring 5 or more distinct reasoning steps.

    ```
    # Prompt Example for Multi-Step Problem
    What factors contribute to the urban heat island effect and how might cities mitigate these impacts?
    ```

## Advanced Techniques for Deep Reasoning Models

*   **Ensembling**: For critical or very complex tasks, consider running the same prompt multiple times or slight variations (if the model supports non-deterministic output) and then aggregating/comparing the results. This can increase accuracy but also cost.
*   **Single-Question Focus**: Each prompt to a deep reasoning tool should ideally focus on one specific question or problem at a time. Multiple intertwined questions can lead to unfocused or circular analysis.
*   **Context Independence**: These models typically have no memory between interactions. All relevant context must be provided in each prompt.

## Usage within PACT-System Framework

When utilizing a tool symbolically referenced for deep reasoning (e.g., `DEEPSEEK_THINKING`), strictly adhere to PACT-System protocols:

1.  **Permission**: Ensure you have the necessary permissions to use this tool, especially if the reasoning involves sensitive data or could lead to significant system actions based on its output.
2.  **Accountability**: All calls to such tools must be logged.
    *   The prompt (`originPrompt` or equivalent parameter) provided to the tool.
    *   The response received from the tool.
3.  **C (Consent, Compliance, Competency, Clarity)**:
    *   **Consent**: If the prompt contains user data or the output will directly affect a user, ensure appropriate consent mechanisms are in place.
    *   **Compliance**: Ensure the query and expected use of the output comply with all relevant policies and regulations.
    *   **Competency**: Use deep reasoning tools for tasks aligned with their strengths (complex reasoning). Verify their outputs, especially before taking critical actions based on them. Understand their limitations (e.g., structured output, simple tasks, potential for overthinking).
    *   **Clarity**: Ensure that the purpose of using the tool and the interpretation of its results are clear to the user if they are involved in the loop or if the results form the basis of user-facing information.
4.  **Transparency**: Document the purpose and reasoning for each tool call using the standard PACT-System tool call template (see `tool_call_template.md`).
    *   **Symbolic Invocation Example (as per `tool_call_template.md` and `symbolic_tool_references.md`):**
        ```
        [ℹ️ Purpose] I'll use DEEPSEEK_THINKING to analyze the logical consistency of the proposed state transition rules which will help ensure system stability.

        DEEPSEEK_THINKING(originPrompt="Analyze the following state transition rules for logical contradictions: [rules details]")

        [✅ Result] DEEPSEEK_THINKING provided an analysis identifying two potential edge case conflicts.
        ```
5.  **System Impact**: Update the knowledge graph or other system state representations with significant findings or decisions derived from the tool's output, ensuring traceability.

## Key Parameters (Illustrative for a specific implementation like `mcp_deep_reasoner_get_deepseek_thinker`)

*   `originPrompt` (String): The primary input containing the question, problem, or context for the model to reason about.
*   `temperature` (Float, Optional): Typically 0.5-0.7 for some models (like DeepSeek-R1) for balanced creativity and coherence. (Consult specific model/implementation documentation for defaults and applicability).

Refer to `symbolic_tool_references.md` and the specific documentation for the resolved actual tool implementation for precise parameter names and options for the deep reasoning tool in your environment. 
# PACT System Glossary

This document defines key terms and concepts used throughout the PACT System documentation.

## Core Concepts

### PACT System
The Prompt-Activated Control Technology System (PACT-S), a framework for governing AI agent behavior through formal verification and compliance mechanisms.

### Prompt-Critical System
A system where improper prompting could lead to unintended or harmful behaviors. The PACT System is designed to establish guardrails for such systems.

### Protocol
A formal specification of expected behavior, interaction patterns, or workflows within the PACT System. Protocols serve as the primary governance mechanism.

### Compliance
Adherence to established protocols and principles within the PACT System framework.

## Verification Terminology

### Formal Verification
The process of mathematically proving that system behaviors adhere to specified requirements.

### Z3 Solver
An SMT (Satisfiability Modulo Theories) solver used within PACT-S for formal verification tasks.

### Knowledge Graph
A semantic network representing relationships between concepts, used for reasoning about system state and behavior.

## Tool and Component Terminology

### Agent
An autonomous or semi-autonomous AI system that performs tasks based on prompts or instructions.

### Tool
A specific capability provided to an agent to perform operations on external systems or data.

### Reasoning Engine
A component that applies logical inference to determine appropriate actions or verify constraints.

## Development Terminology

### Worktree
A Git feature allowing multiple working directories from the same repository, used in PACT-S for managing parallel development streams. 
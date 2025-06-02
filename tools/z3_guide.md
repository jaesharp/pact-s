# Z3 SMT Solver (Z3_SOLVER_*) Usage Guide

This guide provides comprehensive documentation for effectively using the Z3 SMT (Satisfiability Modulo Theories) Solver within the PACT-System framework. Z3 is a powerful tool for constraint solving, formal verification, and mathematical proofs.

## Overview and Capabilities

- **Symbolic Name Pattern**: `Z3_SOLVER_*` (e.g., `Z3_SOLVER_ADD_ITEM`, `Z3_SOLVER_SOLVE_MODEL`, `Z3_SOLVER_CLEAR_MODEL`, etc.)
- **Actual Implementation Examples**: `mcp_Toolbase_via_z3_sat_smt_add_item`, `via_z3_sat_smt_solve_model` (Note: Always refer to `symbolic_tool_references.md` for current mappings).
- **Purpose**: Enables formal verification of system properties, solving complex constraint satisfaction problems, and proving mathematical theorems. Particularly useful for ensuring correctness in PACT-System protocols, mode transitions, and compliance rules.

## Essential Requirements & Best Practices

These practices are critical for successful and reliable Z3 model development and execution.

### 1. Solver Interaction and Solution Export

*   **Import `export_solution`**: When working with Z3 through an environment that requires explicit solution export (like `mcp_solver`), **ALWAYS** import the necessary helper:
    ```python
    from mcp_solver.z3 import export_solution # Path may vary based on environment
    ```
*   **Call `export_solution`**: After a `solver.check() == sat` result, **ALWAYS** call `export_solution` with both `solver` and `variables` parameters to properly capture and return the model/solution.
    ```python
    if solver.check() == sat:
        export_solution(solver=solver, variables=variables) # `variables` is a dict mapping names to Z3 variable objects
    else:
        print("No solution found (UNSAT)")
    ```
    Failure to do so will result in lost solutions even if Z3 finds one.
*   **Boolean Results**: If you need to export a Python boolean result (e.g., verification status), connect it to a Z3 Boolean variable within a new solver instance for export:
    ```python
    python_result = True # Your Python boolean result
    z3_bool_result = Bool('my_verification_result')
    result_solver = Solver()
    result_solver.add(z3_bool_result == python_result)
    export_solution(solver=result_solver, variables={"my_verification_result": z3_bool_result})
    ```

### 2. Variable Types and Declarations

*   **Use Z3 Types**: Always use Z3 type constructors for variables involved in constraints. Do not mix Python primitives directly in Z3 expressions.
    *   `x = Int('x')` (Unbounded integer)
    *   `r = Real('r')` (Rational number, for precise division)
    *   `b = Bool('b')` (Boolean)
    *   `bv = BitVec('bv', 32)` (32-bit bit-vector)
    *   Multiple: `x, y, z = Ints('x y z')` or `a, b = Reals('a b')`
*   **Incorrect Python Primitives**: 
    ```python
    # INCORRECT
    py_int = 5
    z3_y = Int('y')
    # solver.add(py_int + z3_y == 10) # This will cause an error like "'int' object has no attribute 'as_ast'"
    
    # CORRECT
    z3_x = Int('x')
    z3_y = Int('y')
    solver.add(z3_x == 5) # Set value through a constraint
    solver.add(z3_x + z3_y == 10)
    ```

### 3. Mathematical Operations

*   **Division**: 
    *   For symbolic integers where exact division is expected (like `(n*(n+1))/2`), use `/`. Z3's `Int` can handle rational results if the expression implies it, or use `Real` type for variables if fractional results are inherent.
        ```python
        n = Int('n')
        formula = (n * (n + 1)) / 2 # Preferred for symbolic expressions
        ```
    *   If you strictly need integer division semantics (truncation) and are working with `Int` variables, ensure context or constraints enforce this. Using `//` directly with Z3 `ArithRef` types will lead to `TypeError`.
    *   For `BitVec` division: `UDiv(x,y)` for unsigned, `x / y` for signed.
*   **Algebraic Manipulation**: Use `simplify(expression)` to expand, simplify, or canonicalize Z3 expressions. Useful for verifying algebraic equalities.
    ```python
    k = Int('k')
    expr1 = (k + 1)**3 - k**3
    expanded_expr = simplify(expr1) # Result: 3*k*k + 3*k + 1
    ```

### 4. Model Structuring

*   **Clear Formulation**: Organize Z3 code with clear problem formulation, variable definitions, and constraints, often within functions.
    ```python
    def build_my_model():
        x, y = Ints('x y')
        s = Solver()
        s.add(x > 0, y > x, x + y == 20)
        return s, {"x_val": x, "y_val": y}
    # ... then use solver, variables = build_my_model() ...
    ```
*   **Domain Constraints**: Always add explicit domain constraints (bounds) for variables if they are not globally unbounded in your problem (e.g., `color >= 0, color < max_colors`).
*   **Logical Operators**: Use Z3's operators: `And(a,b,c)` or `a & b & c`; `Or(a,b,c)` or `a | b | c`; `Not(a)` or `~a`; `Implies(a,b)`; `Xor(a,b)`; `a == b` for equivalence.
    *   Ensure proper grouping for compound formulas: `And(Implies(p,q), Implies(q,r), Not(Implies(p,r)))`.
*   **Incremental Solving**: Use `solver.push()` and `solver.pop()` to manage scopes for temporary or exploratory constraints without rebuilding the entire model.

### 5. Troubleshooting

*   **Common Errors**:
    *   `'bool' object has no attribute 'as_ast'`: Convert Python boolean to Z3 `Bool`.
    *   `'int' object has no attribute 'as_ast'`: Use Z3 `Int`, not Python int.
    *   `"Solver returned unknown"` or timeouts: Problem may be too complex, under-constrained, or genuinely difficult. Try `solver.set("timeout", milliseconds)`.
*   **Debugging Checklist**:
    1.  ✓ `export_solution` imported and called correctly (with `solver` and `variables`)?
    2.  ✓ `solver.check() == sat` confirmed before `export_solution`?
    3.  ✓ All variables for export collected in the `variables` dictionary?
    4.  ✓ Using Z3 types, not Python primitives, in constraints?
    5.  ✓ Correct logical operators and grouping?
    6.  ✓ Necessary domain constraints applied?

## Symbolic Tool Interface for Z3 Operations

Within the PACT-System, Z3 operations are typically wrapped by symbolic tool references (defined in `symbolic_tool_references.md`). Common operations include:

*   `Z3_SOLVER_CLEAR_MODEL`: Resets/clears the current Z3 model.
*   `Z3_SOLVER_ADD_ITEM`: Adds Python code (a Z3 script segment) to the model, often at a specific index.
    *   *Parameter Example*: `index` (integer), `content` (string of Python/Z3 code).
*   `Z3_SOLVER_REPLACE_ITEM`: Replaces an item/script segment in the model.
*   `Z3_SOLVER_DELETE_ITEM`: Deletes an item/script segment.
*   `Z3_SOLVER_GET_MODEL`: Retrieves the current model (e.g., list of script items).
*   `Z3_SOLVER_SOLVE_MODEL`: Solves the current model.
    *   *Parameter Example*: `timeout` (float, in seconds).

## PACT-System Specific Applications & Examples

### 1. Formal Verification of PACT-System Protocols
   Z3 can be used to model and verify properties of the PACT-System itself, such as:
   *   **Mode Transitions**: Ensuring that transitions between operational modes (e.g., SANDBOX, FULL_ACCESS) adhere to defined rules and pre-conditions (permissions, consent, verification status). (See `tools/examples/z3_pact_verification_example.py` for a detailed example).
   *   **Compliance Rules**: Modeling compliance rules as constraints to check if certain operations or states would violate them.
   *   **Circular Temporal Dependencies**: Verifying consistency in systems with versioned protocols or bootstrapping trust, like the t0 (bootstrap PACTS), t1 (current PACTS), t2 (future PACTS) model. (Also demonstrated in `z3_pact_verification_example.py`).

### 2. Mathematical Induction Proofs
   Structure your proof by:
   1.  Setting up Z3 and `export_solution`.
   2.  (Optional) Verifying concrete examples in Python.
   3.  Verifying the base case (e.g., n=1) using Z3 constraints.
   4.  Verifying the inductive step: Assume property holds for `k`, prove for `k+1`. This often involves setting up a solver to check if `(property(k) AND NOT property(k+1))` is unsatisfiable (`unsat`).
   5.  Exporting the overall `proof_verified` boolean result.

### 3. Optimization Problems (If Z3 version/extensions support it)
   While core Z3 is an SMT solver, extensions or related tools can handle optimization. If applicable:
   *   Model resource allocation or scheduling problems.
   *   Define objective functions and constraints.

## Usage within PACT-System Framework

1.  **Permission**: Ensure appropriate permissions for defining/modifying/solving formal models, especially if these models influence system behavior.
2.  **Accountability**: Log all significant Z3 operations: model changes (content of added/replaced items), solve attempts, and results.
3.  **C (Consent, Compliance, Competency, Clarity)**:
    *   **Consent**: If Z3 is used to reason about user-specific data or constraints, ensure consent is handled.
    *   **Compliance**: Ensure the Z3 models and their intended use comply with system design and safety protocols.
    *   **Competency**: Understand Z3's strengths (formal logic, SMT) and limitations. Use it for appropriate tasks. Verify that the Z3 model accurately reflects the problem domain.
    *   **Clarity**: Ensure that the Z3 model's purpose, the constraints applied, and the interpretation of its results (sat/unsat, model values) are clearly understood and documented, especially if decisions based on Z3 output affect the user or system operation.
4.  **Transparency**: Document the purpose of Z3 usage with the standard tool call template.
    *   **Symbolic Invocation Example**:
        ```
        [ℹ️ Purpose] I'll use Z3_SOLVER_ADD_ITEM to add constraints for user permission levels and then Z3_SOLVER_SOLVE_MODEL to verify if the 'admin_access_critical_data' scenario is satisfiable under current rules, which will help ensure our permission model is sound.

        Z3_SOLVER_ADD_ITEM(index=1, content="""
        from z3 import *
        from mcp_solver.z3 import export_solution
        # ... Z3 script content ...
        # Ensure it calls export_solution(solver=s, variables=relevant_vars)
        """
        )
        
        [✅ Result] Z3_SOLVER_ADD_ITEM: Item added.

        Z3_SOLVER_SOLVE_MODEL(timeout=30.0)

        [✅ Result] Z3_SOLVER_SOLVE_MODEL: sat, {model details or path to results} 
        ```
5.  **System Impact**: Update the knowledge graph or system documentation with verified properties, model insights, or identified issues from Z3 analysis.

## Combining Z3 with DEEPSEEK_THINKING

A powerful pattern involves using `DEEPSEEK_THINKING` for natural language understanding and problem formulation/reformulation, and Z3 for precise solving and verification:

1.  **Analysis → Formalization → Solving → Verification**: 
    *   `DEEPSEEK_THINKING` helps break down a problem or debug a Z3 model formulation.
    *   Z3 executes the formal model.
    *   `DEEPSEEK_THINKING` can help interpret Z3 results or suggest refinements.
2.  **Best Practices for Integration**: 
    *   Provide `DEEPSEEK_THINKING` with minimal, focused Z3 code/errors.
    *   Have `DEEPSEEK_THINKING` analyze Z3 errors *before* showing it correct solutions.
    *   Always re-verify `DEEPSEEK_THINKING`'s suggested Z3 code fixes with the Z3 solver itself.

    *   Always re-verify `DEEPSEEK_THINKING`'s suggested Z3 code fixes with the Z3 solver itself. 
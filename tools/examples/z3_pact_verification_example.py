"""
Z3 PACT System Mode Transition Verification Example

This example demonstrates how to use Z3 to formally verify the correctness
of mode transitions in the PACT system.
"""

from z3 import *
from mcp_solver.z3 import export_solution  # IMPORTANT: Always import this

# Define the operational modes as Z3 constants
INIT = 0
SANDBOX = 1
AUDIO_CAPTURE = 2
CLIPBOARD_CAPTURE = 3
FULL_ACCESS = 4

def build_pact_transition_model():
    """Build a Z3 model to verify PACT system mode transitions."""
    
    # Create Z3 variables for mode states
    current_mode = Int('current_mode')
    next_mode = Int('next_mode')
    
    # Create variables for permission flags
    has_user_consent = Bool('has_user_consent')
    is_verified = Bool('is_verified')
    has_audio_permission = Bool('has_audio_permission')
    has_clipboard_permission = Bool('has_clipboard_permission')
    
    # Create solver
    solver = Solver()
    
    # Add constraints for valid modes
    solver.add(current_mode >= INIT, current_mode <= FULL_ACCESS)
    solver.add(next_mode >= INIT, next_mode <= FULL_ACCESS)
    
    # Define transition rules
    
    # Rule 1: Cannot transition from INIT to FULL_ACCESS directly
    solver.add(Implies(
        current_mode == INIT,
        next_mode != FULL_ACCESS
    ))
    
    # Rule 2: Need verification to leave SANDBOX
    solver.add(Implies(
        And(current_mode == SANDBOX, is_verified == False),
        next_mode == SANDBOX
    ))
    
    # Rule 3: Need user consent for AUDIO_CAPTURE
    solver.add(Implies(
        And(next_mode == AUDIO_CAPTURE, has_user_consent == False),
        False  # Disallow this transition
    ))
    
    # Rule 4: Need specific permissions for each capture mode
    solver.add(Implies(
        next_mode == AUDIO_CAPTURE,
        has_audio_permission == True
    ))
    
    solver.add(Implies(
        next_mode == CLIPBOARD_CAPTURE,
        has_clipboard_permission == True
    ))
    
    # Rule 5: FULL_ACCESS requires both permissions and verification
    solver.add(Implies(
        next_mode == FULL_ACCESS,
        And(
            has_audio_permission == True,
            has_clipboard_permission == True,
            is_verified == True,
            has_user_consent == True
        )
    ))
    
    # Collect all variables
    variables = {
        "current_mode": current_mode,
        "next_mode": next_mode,
        "has_user_consent": has_user_consent,
        "is_verified": is_verified,
        "has_audio_permission": has_audio_permission,
        "has_clipboard_permission": has_clipboard_permission
    }
    
    return solver, variables

def verify_property_one():
    """Verify that without verification, we can't reach FULL_ACCESS."""
    
    solver, variables = build_pact_transition_model()
    
    # Add specific scenario to verify
    solver.push()
    solver.add(variables["is_verified"] == False)
    solver.add(variables["next_mode"] == FULL_ACCESS)
    
    # If this is UNSAT, it means the property holds
    result = solver.check()
    property_holds = (result == unsat)
    
    solver.pop()
    
    # Create a Z3 boolean to hold the result
    verification_result = Bool('verification_result')
    result_solver = Solver()
    result_solver.add(verification_result == property_holds)
    
    # Export the result
    export_solution(solver=result_solver, variables={"verification_result": verification_result})
    
    return property_holds

def verify_property_two():
    """Verify that user consent is required for any capture mode."""
    
    solver, variables = build_pact_transition_model()
    
    # Add specific scenario to verify
    solver.push()
    solver.add(variables["has_user_consent"] == False)
    solver.add(Or(
        variables["next_mode"] == AUDIO_CAPTURE,
        variables["next_mode"] == CLIPBOARD_CAPTURE
    ))
    
    # If this is UNSAT, it means the property holds
    result = solver.check()
    property_holds = (result == unsat)
    
    solver.pop()
    
    # Create a Z3 boolean to hold the result
    verification_result = Bool('verification_result')
    result_solver = Solver()
    result_solver.add(verification_result == property_holds)
    
    # Export the result
    export_solution(solver=result_solver, variables={"verification_result": verification_result})
    
    return property_holds

def verify_pact_circular_dependency():
    """
    Verify that the circular temporal dependency between bootstrap PACTS (t0),
    current PACTS (t1), and future PACTS (t2) is consistent.
    """
    # Create Z3 variables for PACTS versions at different times
    bootstrap_pacts = Int('bootstrap_pacts')  # t0
    current_pacts = Int('current_pacts')      # t1
    future_pacts = Int('future_pacts')        # t2
    
    # Create version numbers
    bootstrap_version = Int('bootstrap_version')
    current_version = Int('current_version')
    future_version = Int('future_version')
    
    # Create solver
    solver = Solver()
    
    # Add basic version constraints
    solver.add(bootstrap_version >= 0)
    solver.add(current_version > bootstrap_version)
    solver.add(future_version > current_version)
    
    # Enforce circular dependency constraints
    
    # 1. Bootstrap PACTS must be signed by current PACTS
    solver.add(Implies(
        bootstrap_pacts == bootstrap_version,
        current_pacts == current_version
    ))
    
    # 2. Current PACTS must be signed by bootstrap PACTS
    solver.add(Implies(
        current_pacts == current_version,
        bootstrap_pacts == bootstrap_version
    ))
    
    # 3. Future PACTS must be signed by current PACTS
    solver.add(Implies(
        future_pacts == future_version,
        current_pacts == current_version
    ))
    
    # Test an invalid state: break the chain
    solver.push()
    solver.add(future_pacts == future_version)
    solver.add(current_pacts != current_version)
    
    # This should be UNSAT if our circular dependency is properly enforced
    chain_preserved = (solver.check() == unsat)
    solver.pop()
    
    # Export the result using the proper approach
    verification_result = Bool('chain_preserved')
    result_solver = Solver()
    result_solver.add(verification_result == chain_preserved)
    
    variables = {
        "chain_preserved": verification_result,
        "bootstrap_version": bootstrap_version,
        "current_version": current_version,
        "future_version": future_version
    }
    
    # IMPORTANT: Always use export_solution with both parameters
    export_solution(solver=result_solver, variables=variables)
    
    return chain_preserved

if __name__ == "__main__":
    # Verify properties
    print("Verifying that without verification, we can't reach FULL_ACCESS...")
    property_one_holds = verify_property_one()
    print(f"Property 1 holds: {property_one_holds}")
    
    print("\nVerifying that user consent is required for any capture mode...")
    property_two_holds = verify_property_two()
    print(f"Property 2 holds: {property_two_holds}")
    
    print("\nVerifying PACT circular temporal dependency...")
    chain_preserved = verify_pact_circular_dependency()
    print(f"Circular dependency chain preserved: {chain_preserved}")
    
    # Overall verification
    all_verified = Bool('all_verified')
    final_solver = Solver()
    final_solver.add(all_verified == And(property_one_holds, property_two_holds, chain_preserved))
    
    # IMPORTANT: Always use export_solution
    export_solution(solver=final_solver, variables={"all_verified": all_verified})
    
    print("\nAll properties verified:", property_one_holds and property_two_holds and chain_preserved) 
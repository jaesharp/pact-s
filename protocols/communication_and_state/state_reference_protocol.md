# State Reference Protocol

This protocol governs how saved states are referenced and loaded from memory.

## Overview

The State Reference system allows loading specific configurations, settings, and knowledge states using a simple reference notation. This enables consistent application of previously established states across conversations.

## Reference Notation

The standard notation for referencing a saved state is:

```
@@reference {TAG}
```

Where `{TAG}` is the exact name of a SystemState entity stored in the knowledge graph.

## Processing Protocol

When a state reference notation is encountered:

1. **Verification**: Check if the referenced tag exists in the knowledge graph
2. **Retrieval**: Load all observations associated with the referenced entity
3. **Relation Mapping**: Load all entities connected by relations to the referenced state
4. **Application**: Apply the configuration settings from the loaded state
5. **Confirmation**: Report successful loading of the referenced state
6. **Validation**: Verify the system is operating with the loaded state

## Error Handling

If the referenced tag does not exist or cannot be loaded:

1. Report the failure with `[❌ Error] Failed to load reference {TAG}`
2. Continue operating with the current state
3. Suggest available valid references if possible

## State Creation

New reference states are created using the following process:

1. Create a SystemState entity with a unique, descriptive name (recommended format: `SYSTEM_VERSION_DATE`)
2. Add detailed observations documenting the state's properties and configuration
3. Create relations between the state and its component entities
4. Verify the state can be successfully referenced

## Example Usage

```
User: Load the PACT configuration from our previous session
Assistant: I'll check for saved states.
User: @@reference PACTIFY_V1.0_20250330
Assistant: [✅ Success] Loaded state PACTIFY_V1.0_20250330. Operating with enhanced compliance checks and verification tokens.
```

## State Documentation Standards

All saved states should include at minimum:
- System version and creation date
- Complete configuration settings
- Tool formats and templates
- Protocol versions being used
- Relations to component entities 
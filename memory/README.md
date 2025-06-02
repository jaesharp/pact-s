# PACT-System Memory: Architecture, Schema, and Knowledge Graph Protocol

This document provides a comprehensive overview of the PACT-System's conceptual memory architecture, its knowledge graph (KG) schema, and the protocols for its access and maintenance. The memory system is crucial for enabling context persistence, state tracking, accountability, and transparency across PACT-System operations. It links closely with the [main PACT-System README](../README.md) and the [core principles](../core/principles.md).

## 1. Memory System Architecture Overview

The PACT-System memory is envisioned primarily as a structured knowledge graph. This KG enables persistent, contextual memory across sessions and system interactions, supporting the PACT-System's governance functions.

### 1.1. Core Components

1.  **Knowledge Graph (KG) & Fact Log**: The backbone of the memory system. It's a collection of immutable facts (datoms).
    *   **Entities**: Distinct objects, concepts, records, or system elements with unique identifiers (E in EAVT).
    *   **Attributes**: Define the nature of a property associated with an entity (A in EAVT). These are part of the schema.
    *   **Values**: The actual data for an attribute of an entity (V in EAVT).
    *   **Transactions (Tx)**: Atomic operations that group one or more new facts. Each fact is associated with a transaction, representing the point in time it was asserted. Transactions are ordered, providing a temporal dimension.
    *   **Entity Types & Attribute Schema**: Classifications (categories) that define the nature, properties (attributes), and valid relations of entities. The schema defines allowed attributes for entity types and the types of values attributes can take.
    *   **Relations**: While Datomic often models relations as attributes whose values are references to other entities, we can conceptually maintain "Relations" as typed, directed connections. In a Datomic-like model, a relation `(Entity1)-[RelatesTo]->(Entity2)` could be represented as a fact `[Entity1, :RelatesTo, Entity2, TxID]`.

2.  **Memory Operations Framework**: A set of standardized (preferably symbolic) tool interfaces for interacting with the KG. These operations facilitate:
    *   Assertion and retraction of facts (conceptually, retraction is asserting a new fact that supersedes or negates a previous one, or marking it as no longer current). Datomic itself adds new facts.
    *   Entity creation (asserting initial facts about an entity), attribute value updates (asserting new facts with new values for an attribute).
    *   Schema evolution (e.g., adding new attributes).
    *   Graph querying and traversal, including "as-of" queries that inspect the state of the KG at a specific transaction time.
    *   (e.g., [`ASSERT_FACTS`](../tools/symbolic_tool_references.md#tool-assert_facts), [`QUERY_AS_OF`](../tools/symbolic_tool_references.md#tool-query_as_of), [`SEARCH_NODES_CURRENT`](../tools/symbolic_tool_references.md#tool-search_nodes_current), [`KG_DATALOG_READ`](../tools/symbolic_tool_references.md#tool-kg_datalog_read)).
    *(Refer to [`../tools/symbolic_tool_references.md`](../tools/symbolic_tool_references.md) for specific symbolic tool names - these will need updating to reflect a Datomic-like approach)*

3.  **Persistence Layer**: The underlying mechanism for storing and retrieving the immutable log of facts and the indexes that support efficient querying. This might involve:
    *   Databases designed for immutable data (like Datomic itself, or systems built on append-only logs).
    *   Graph databases adapted for versioning, or traditional databases with a carefully designed schema to manage historical data.
    *   Mechanisms for serialization, transaction processing, and maintaining indexes over the facts.

### 1.2. Operational Principles

1.  **PACT-System Compliance**: All memory operations MUST adhere to the PACT-System principles:
    *   **Permission**: Operations (especially assertions of new facts) require appropriate authorization based on user consent, agent roles, and operational mode.
    *   **Accountability**: Changes to the KG (assertion of new facts, schema modifications) are inherently tracked with attribution via the transaction mechanism (who/what caused the transaction and why, linked to a `pact` record if applicable).
    *   **C (Consent, Compliance, Competency, Clarity)**:
        *   Memory content (facts) related to user data requires user **Consent** for its collection and assertion.
        *   Operations must **Comply** with data handling protocols, retention policies, and schema rules.
        *   Agents interacting with memory must demonstrate **Competency** in forming correct transactions and queries.
        *   The structure, purpose, and history of the KG should be documented with **Clarity**, leveraging the immutable nature of the data.
    *   **Transparency**: Memory state (as appropriate for different roles/permissions) is inspectable at any point in time. Operations on memory are logged as transactions.

2.  **Data Integrity & Coherence (Memory Coherence Model)**:
    *   **Immutability**: The KG is built from an append-only log of facts (datoms). Facts are never changed in place; new facts are added. This provides a complete history and simplifies auditing and debugging.
    *   **Schema Adherence**: All asserted facts MUST conform to the defined `PACT_System_Memory_Schema` at the time of their transaction. Attributes and their value types must be consistent with the schema version active for that transaction.
    *   **Validation**: New facts within a transaction should be validated against schema rules and other consistency constraints (e.g., type checking, required attributes for new entities, valid references).
    *   **Observation Standards (Fact Assertion)**: Define how factual data and metadata are recorded as entity-attribute-value triples within a transaction.

3.  **Transaction Support (ACID)**:
    *   Memory operations are grouped into atomic transactions. Each transaction is a set of new facts to be added to the KG.
    *   Transactions MUST be **Atomic**: They either succeed entirely or fail entirely, leaving the KG in a consistent state. No partial application of facts from a transaction is permitted.
    *   Transactions ensure **Consistency**: They move the KG from one valid state to another, respecting all schema and integrity constraints.
    *   **Isolation**: Concurrent transactions should appear to execute serially, or their outcomes must be as if they did. (The specific isolation level depends on the underlying persistence layer, but Datomic provides serializability).
    *   **Durability**: Once a transaction is committed, its facts are permanently stored and will survive system failures.
    *   Each fact is implicitly associated with the transaction that asserted it, providing a `TxID` or timestamp, which is crucial for temporal queries.

### 1.3. Memory Access Patterns (How the KG is Used)

The PACT-System memory, built upon an immutable log of facts, supports both explicit and implicit modes of information recording and recall:

*   **Explicit Memory Operations (Database-like Functionality):**
    *   **Recording**: Deliberate assertion of specific facts (datoms: Entity-Attribute-Value-Transaction) into the KG. This includes creating new entities, updating attribute values (by asserting new facts), and defining explicit relationships. Each assertion is precisely timestamped by its transaction and forms part of the immutable historical record.
    *   **Recall**: Targeted, query-based retrieval of specific, verifiable information. This involves:
        *   **Direct Entity Access (Current State)**: Retrieving the current attribute values for specific entities by unique identifiers.
        *   **Historical Entity Access ("As-Of" Queries)**: Retrieving the state of specific entities (their attribute values and relations) *as of* a specific past transaction ID or point in time.
        *   **Structured Search & Query Patterns (Current State & Historical)**:
            *   Text-based search across entity names, descriptions, and key attribute values.
            *   Filtering entities based on their type (e.g., find all `Protocol` entities that were active at time T).
            *   Pattern-based graph traversal using defined relationships (e.g., find all `Tasks` that `dependOn` a `Resource` that `hasStatus` "Unavailable" in the current state, or at a past time).
            *   **Datalog Queries**: For complex declarative queries, pattern matching, and inference over the entire history of facts.

*   **Implicit Memory Functions (Recommender/Associative Functionality - Built on Explicit Data):**
    *   **Recording/Formation**: While not direct recording in the same way as explicit facts, implicit memory forms through the continuous analysis of the explicit KG. This can involve:
        *   Systematic derivation of new, summary, or inferred facts from existing explicit data (e.g., via automated reasoning rules or graph analytics).
        *   Statistical learning from patterns, co-occurrences, and sequences within the KG (e.g., identifying that certain types of tasks frequently encounter similar blockers).
        *   The KG's structure itself, with its dense interconnections, inherently encodes many implicit relationships that can be discovered.
    *   **Recall/Surfacing**: Associative retrieval where the system surfaces relevant information based on current context, similarity, or learned patterns, rather than a precise query. This supports:
        *   **Contextual Recommendations**: Suggesting relevant `DocumentationArtifacts`, `KnowledgeSources`, `SymbolicToolReferences`, or similar past `PactRecords` based on the current `ProjectContext`, `Task`, or `Agent` activity.
        *   **Pattern Recognition & Anomaly Detection**: Identifying deviations from common patterns or surfacing emerging trends by analyzing trajectories of change in the KG over time.
        *   **Predictive Insights**: Using historical data patterns in the KG to suggest potential future states, risks, or opportunities (e.g., if a certain combination of `SystemComponent` states has historically preceded an issue, flag it).
        *   **Knowledge Discovery**: Uncovering non-obvious relationships or insights through graph traversal algorithms, link analysis, or machine learning models operating on KG embeddings.

*   **Knowledge Extraction & Reasoning Support (Bridging Explicit and Implicit)**:
    *   The fact log and its queryability support pattern matching to identify complex situations across time, forming the basis for both precise lookups and the raw material for implicit memory functions.
    *   With an ontological layer and Datalog, inference based on relation chains, class hierarchies, and historical states can be enabled, blurring the lines between explicitly queried data and implicitly surfaced insights.
    *   Summarization of connected subgraphs at specific points in time, or changes over time, can provide context or answer queries, supporting both explicit reporting and implicit understanding.

### 1.4. Knowledge Graph Visualization (Conceptual)

Visualizing the KG (or parts of it) can aid human understanding. A typical visualization might represent:
*   Nodes as entities, perhaps colored or shaped by entity type.
*   Edges as relations, labeled with the relation type.
*   Node size could indicate information density (e.g., number of properties/observations).
*   Edge thickness could represent relation strength or frequency.
*(Actual visualization tools and outputs depend on the chosen KG technology and tooling.)*

### 1.5. Future Enhancements (Considerations for PACT-System Memory)

*   **Schema Evolution Mechanics**: Formalize how the schema (definitions of entity types, attributes, and their types) can evolve over time. In a Datomic-like system, schemas are also data; new attributes can be added, and existing ones can be retired without altering historical facts, which remain consistent with the schema version under which they were asserted.
*   **Inherent Temporal Tracking & Querying**: Leverage the immutable fact log and transaction IDs to provide robust temporal querying capabilities as a core feature, not just an add-on. This includes querying the state of the entire KG or specific entities "as of" any transaction time or logical time point.
*   **Advanced Datalog/Symbolic Reasoning**: Extend query capabilities with more sophisticated Datalog features or other symbolic reasoning engines that can operate over the historical fact log for complex event processing, causal analysis, or temporal pattern detection.
*   **Belief Systems/Confidence Scoring (as facts)**: Represent information about belief, confidence, or alternative hypotheses as explicit facts within the KG, associated with specific transactions. This allows tracking how beliefs change over time.
*   **Contextual Indexing for Temporal Queries**: Optimize indexing strategies to support efficient temporal queries and traversals across different time slices of the KG.
*   **Memory Compaction & Tiered Storage (Conceptual)**: While all facts are retained, explore strategies for logical compaction or moving older/less frequently accessed parts of the fact log to slower/cheaper storage tiers, while maintaining queryability. (Note: Datomic itself handles much of this internally).
*   **Formalized Retraction Semantics**: Define clear semantics for how information is "retracted" or superseded (e.g., by asserting a new fact that explicitly negates or replaces a previous one for a given entity-attribute pair from a certain time forward).

## 2. Knowledge Graph Schema (`PACT_System_Memory_Schema`)

The `PACT_System_Memory_Schema` defines the conceptual model for the PACT-System's knowledge graph. It includes entity types, their properties (attributes in an EAVT context), and the types of relationships that can exist between them. This schema is foundational for ensuring consistency, enabling meaningful queries, and supporting automated reasoning or validation. To support advanced analyses such as causal chain tracing and the recording of relativistic or perspectival observations, the schema must be expressive enough. While the underlying storage may consist of immutable facts (datoms, e.g., Entity-Attribute-Value-Transaction), the entity types and relationship types defined here are designed to allow for layering these complex semantics.

*(The following lists are illustrative and should be considered a starting point, subject to evolution as the PACT-System and its applications are further defined. Specific PACTS instances might extend this core schema.)*

### 2.1. Core Entity Type Categories & Examples

**A. PACT-System Governance & Operational Entities:**
*   `PACT_SystemFramework`: Represents the PACT-System itself, its version, and global configuration settings.
*   `SystemPillar`: Instances represent the PACT-S pillars (e.g., `PermissionPillar_Instance`, `AccountabilityPillar_Instance`).
*   `PillarDimension`: Sub-aspects of pillars (e.g., `ConsentDimension`, `ComplianceDimension`, `CompetencyDimension`, `ClarityDimension` as part of the `C_Pillar`).
*   `Protocol`: A defined operational protocol document (e.g., `ModeTransitionProtocol`, `ToolUsageProtocol`).
*   `Policy`, `Rule`: Formal or semi-formal statements governing system behavior or compliance requirements.
*   `OperationalMode`: Current or defined operational states of an agent or system (e.g., `PlanningMode`, `ImplementationMode`).
*   `PermissionGrant`: A record of a permission being granted, detailing actor, action, resource, context, and constraints.
*   `ConsentRecord`: A record of user consent, detailing scope, purpose, and expiry.
*   `CompetencyProfile`: Describes the verified capabilities of an agent or tool.
*   `Capability`: A specific skill, function, or access right defined within a `CompetencyProfile`.
*   `AuditRecord`: A log entry for accountability and transparency, can be an umbrella for `LogEntry`, `PactRecord`.
*   `PactRecord`: A specific, atomic record of a fully PACT-System compliant operation/interaction unit.
*   `ToolCallEvent`: Detailed log of a symbolic tool invocation, including reasoning, parameters, and outcome.
*   `ComplianceEvent`: Record of a compliance check, violation, or status update.
*   `VerificationArtifact`: Evidence supporting a verification claim.

**B. User, Agent & System Entities:**
*   `User`: A human user interacting with or authorizing the system.
*   `Agent`: An AI agent or automated process operating under PACT-System governance.
*   `SystemComponent`: A logical or physical part of a system being developed, managed by, or interacting with PACT-System.
*   `Resource`: Any data, service, or capability that can be an object of actions and permissions.

**C. Task, Project & State Management Entities:**
*   `ProjectContext`: Top-level context for a project being worked on under PACT-System governance.
*   `Plan`: A strategic document or a detailed implementation plan.
*   `Phase`, `Subphase`, `Task`: Hierarchical work breakdown structure.
*   `StatusReport`: Records the state of projects, tasks, or system components (e.g., includes `completionStatus`, `blockers`).
*   `DecisionRecord`: Documentation of a significant decision, its rationale, and context.
*   `CurrentSessionState`: Holds transient operational context for an ongoing agent-user interaction.
*   `RecallTag`: A persistent named snapshot of a significant state or context that can be referenced (e.g., `@@reference {TAG}` - see [`../protocols/state_reference_protocol.md`](../protocols/state_reference_protocol.md)).

**D. Tool & Environment Entities:**
*   `SymbolicToolReference`: An abstract definition of a tool capability (as in [`../tools/symbolic_tool_references.md`](../tools/symbolic_tool_references.md)).
*   `ActualToolImplementation`: A concrete tool or function that implements a symbolic tool in a specific environment.
*   `EnvironmentProfile`: Defines a set of mappings from symbolic tools to actual implementations for a given environment.
*   `ToolMetadata`: Broader information about a tool (e.g., its own PACT-System compliance, version, dependencies).
*   `Dependency`: External software, data, or service dependencies.
*   `ConfigurationSetting`: A specific configuration parameter and its value.

**E. Documentation & Knowledge Artifacts:**
*   `DocumentationArtifact`: A specific document, guide, or specification (e.g., this `README.md`).
*   `Requirement`: A functional or non-functional requirement for a system or feature.
*   `KnowledgeSource`: External information source used or referenced.

**F. Causal, Temporal & Perspectival Modeling Entities (Illustrative for Advanced Analysis):**
*   `CausalAssertion`: Represents a stated or inferred causal link between entities (e.g., events, states, actions).
    *   Key Attributes: `assertedBy` (ref to `User`/`Agent`), `assertionTime` (timestamp or Tx ref), `causeElement` (ref to an Entity/Event), `effectElement` (ref to an Entity/Event), `causalMechanism` (description or ref), `confidenceScore`, `evidence` (refs or description), `validityContext` (ref to `FrameOfReference`).
*   `ObservationRecord`: Encapsulates a specific observation made by an actor at a point in time, potentially from a specific perspective or within a defined context.
    *   Key Attributes: `observer` (ref to `User`/`Agent`), `observedEntity` (ref), `observedAttribute` (e.g., schema-defined attribute keyword), `observedValue`, `observationTimeActual` (timestamp of observation), `recordingTime` (Tx ref of when this record was made), `perspective` (ref to `FrameOfReference`), `instrument` (ref or description), `confidenceScore`, `annotation`.
*   `FrameOfReference` (or `PerspectiveContext`): Defines a specific context, viewpoint, set of assumptions, or spatio-temporal frame under which an observation is made, an assertion is considered valid, or a simulation is run.
    *   Key Attributes: `frameIdentifier`, `description`, `definingParameters` (e.g., coordinate system, observer location/velocity, assumed constants, relevant policies), `sourceOrOriginator`, `temporalValidity` (start/end time for the frame itself).
*   `TemporalBoundary`: Represents a significant point or interval in time, potentially marking state changes or event occurrences (e.g., `EventStartTime`, `StateValidFrom`).

*(Note: This list is not exhaustive and some previously mentioned types like `Process`, `Timeline`, `Risk`, `Interface`, `DataModel`, `DesignPattern`, `TestType`, `Technology`, `Metric` can be considered as specific properties of, or related to, the broader categories above, or as distinct types if granularity is needed.)*

### 2.2. Key Relationship Types & Examples

*(Relationship names should ideally be standardized, e.g., camelCase or a controlled vocabulary based on RDF/OWL conventions if moving towards formal ontology.)*

**A. General & Structural:**
*   `rdf:type` (or `isA`): Assigns an entity to an Entity Type.
*   `dcterms:title`, `dcterms:description`, `dcterms:identifier`, `dcterms:created`, `dcterms:modified` (Dublin Core terms for common metadata).
*   `contains` / `isPartOf`: For composition (e.g., `ProjectContext` `contains` `Phase`; `Task` `isPartOf` `Phase`).
*   `relatedTo`: General, untyped association.
*   `mentions` / `references`: (e.g., `DocumentationArtifact` `mentions` `SystemComponent`).

**B. PACT-System Specific Governance:**
*   `hasPillar` (`PACT_SystemFramework` -> `SystemPillar`).
*   `hasDimension` (`C_Pillar` -> `ConsentDimension`).
*   `governedBy` (`AgentAction` -> `PactRecord`; `ProjectContext` -> `PACT_SystemFramework` instance).
*   `grantsPermission` (`User` -> `PermissionGrant`).
*   `permissionAppliesTo` (`PermissionGrant` -> `Agent`, `PermissionGrant` -> `ActionType`, `PermissionGrant` -> `Resource`).
*   `requiresPermission` (`AgentAction` -> `PermissionGrant`).
*   `recordsUserConsent` (`User` -> `ConsentRecord`).
*   `consentAppliesTo` (`ConsentRecord` -> `DataProcessingActivity`).
*   `compliesWith` (`AgentAction` -> `Policy`; `SystemComponent` -> `Standard`).
*   `hasCompetencyProfile` (`Agent` -> `CompetencyProfile`).
*   `requiresCapability` (`Task` -> `Capability`).
*   `evidencesClarityThrough` (`AgentResponse` -> `LogEntry`).
*   `loggedAs` (`AgentAction` -> `AuditRecord`).
*   `accountableUser` (`AgentAction` -> `User`).
*   `initiatedByUser` (`AgentAction` -> `User`).

**C. Process, Workflow & Dependency:**
*   `dependsOn` (`TaskA` -> `TaskB`; `SystemComponentA` -> `SystemComponentB`).
*   `precedes` / `follows` (`PhaseA` -> `PhaseB`).
*   `triggers` (`Event` -> `Action`).
*   `generates` / `produces` (`Action` -> `Artifact`).
*   `inputFor` / `outputOf` (`DataModel` -> `Process`).
*   `hasStatus` (`Task` -> `StatusReport`).
*   `isBlockedBy` (`Task` -> `Risk` or another `Task`).

**D. Tooling & Implementation:**
*   `implements` (`ActualToolImplementation` -> `SymbolicToolReference`; `CodeModule` -> `InterfaceDefinition`).
*   `usesTool` (`AgentAction` -> `SymbolicToolReference`).
*   `hasProfileMapping` (`SymbolicToolReference` -> `EnvironmentProfile`).

**E. Causal, Observational & Temporal Relationships (Illustrative):**
*   `assertsCausality`: Connects an actor (`User`, `Agent`) or a system process to a `CausalAssertion` they are responsible for.
    *   Example: `Agent_X assertsCausality CausalAssertion_123`.
*   `hasCause`: Links a `CausalAssertion` to the entity/event identified as the cause.
    *   Example: `CausalAssertion_123 hasCause Event_A`.
*   `hasEffect`: Links a `CausalAssertion` to the entity/event identified as the effect.
    *   Example: `CausalAssertion_123 hasEffect State_B`.
*   `influences`: A more general relationship indicating that one entity/event has an influence on another, perhaps less direct than `causes`.
    *   Example: `Policy_P influences Decision_D`.
*   `recordedObservation`: Connects an actor (`User`, `Agent`) to an `ObservationRecord` they created.
    *   Example: `User_Y recordedObservation ObservationRecord_456`.
*   `observationConcerns`: Links an `ObservationRecord` to the primary `Entity` being observed.
    *   Example: `ObservationRecord_456 observationConcerns SystemComponent_Z`.
*   `observedWithinFrame`: Links an `ObservationRecord` to the `FrameOfReference` that defines its context.
    *   Example: `ObservationRecord_456 observedWithinFrame Frame_Alpha`.
*   `usesFrame`: Links any entity or assertion (e.g., `PactRecord`, `DecisionRecord`, `CausalAssertion`) to a `FrameOfReference` to contextualize its validity or interpretation.
    *   Example: `PactRecord_789 usesFrame Frame_Regulatory_XYZ`.
*   `hasTemporalBoundary`: Links an entity (e.g., `Event`, `Phase`, `ObservationRecord`) to a `TemporalBoundary` entity defining its start, end, or duration.
    *   Example: `Event_Q hasTemporalBoundary StartTime_Q1`.
*   `derivesFrom`: Indicates that an entity (e.g., a `Plan`, a `Requirement`, an `ObservationRecord`) is derived from or based on another entity.
    *   Example: `Requirement_S derivesFrom KnowledgeSource_T`.

### 2.3. Naming Conventions for Schema Elements

*   **Entity Types**: PascalCase (e.g., `ProjectContext`, `ToolCallEvent`).
*   **Relationship Types (Predicates)**: camelCase (e.g., `dependsOn`, `isImplementedThrough`, `hasStatus`). Use verb phrases where possible to indicate direction and meaning.
*   **Properties (Attributes)**: camelCase (e.g., `creationDate`, `authorName`, `versionNumber`).
*   Strive for clear, descriptive, and unambiguous names, drawing from standard vocabularies (like DC, FOAF, PROV-O) where appropriate if formal ontology is pursued.

### 2.4. Schema Constraints (Conceptual Examples)

*   **Uniqueness**: Entity URIs/IDs must be unique.
*   **Typing**: All entities must belong to at least one defined Entity Type.
*   **Domain/Range**: Relations must connect entities of appropriate types (e.g., `grantsPermission` has a domain of `User` and a range of `PermissionGrant`).
*   **Cardinality**: Define expected number of connections (e.g., a `Task` `hasStatus` exactly one `StatusReport` at any given time).
*   **Property Types**: Values for properties must adhere to defined data types (string, integer, boolean, date, URI, controlled vocabulary terms).
*   **Mandatory Properties**: Certain entity types may require specific properties to be present.

### 2.5. Schema Evolution & Management

The PACT-System Memory Schema is a living definition and will evolve. This requires:

*   **Versioning**: A clear versioning strategy for the schema itself.
*   **Change Management**: Documented process for proposing, reviewing, and implementing schema changes.
*   **Migration Paths**: Strategies for migrating existing KG data if schema changes are not backward-compatible.
*   **Documentation**: The `PACT_System_Memory_Schema` itself should be thoroughly documented, perhaps in this `README.md` or linked detailed documents (e.g., potential link to `../docs/knowledge_management/kg_apache_age_example.md` for specific implementation details if adopted).

## 3. Knowledge Graph Access Protocol (Operational Rules)

This protocol defines mandatory methods for PACT-System agents when accessing and maintaining the knowledge graph. Adherence to this protocol is critical for system integrity, performance, and PACT-System compliance.

### 3.1. Core Principles for KG Access

1.  **`NEVER_USE_READ_ENTIRE_GRAPH` (or equivalent broad, unfiltered queries)**:
    *   The symbolic tool [`READ_ENTIRE_GRAPH`](../tools/symbolic_tool_references.md#tool-read_entire_graph) (or any operation attempting to fetch the entire graph without strong, narrow filters) is **strictly restricted**.
    *   **Reason**: Such operations are highly resource-intensive, can overwhelm memory/context windows of agents, and lead to processing delays or failures.
    *   **Impact**: Violates PACT-System principles of Competency (efficient operation) and can hinder Transparency (if results are truncated or unusable).

2.  **Keyhole Approach Required (Targeted Access)**:
    *   Agents MUST access the KG through defined, targeted entry points or by querying for specific, known entities/patterns.
    *   Example starting points for a PACT-System KG might include:
        *   `SystemMetadata`: For global PACT-System configurations or schema information.
        *   `PACT_System_Protocols`: To query for specific operational protocols.
        *   `CurrentProjectContext` or `CurrentSessionState`: For context relevant to an ongoing task.
        *   Specific User or Agent IDs to fetch their associated permissions, consents, or activity logs.
    *   Traversal from these points should be systematic, following defined relations and leveraging indexed properties.

3.  **Use Appropriate Symbolic Tools for Traversal and Query**: 
    *   [`OPEN_SPECIFIC_NODES`](../tools/symbolic_tool_references.md#tool-open_specific_nodes): For direct entity access when unique identifiers (URIs, names in a defined scope) are known.
    *   [`SEARCH_NODES`](../tools/symbolic_tool_references.md#tool-search_nodes): For finding entities based on specific criteria (type, property values, keywords). Queries should be as precise as possible.
    *   [`KG_CYPHER_READ`](../tools/symbolic_tool_references.md#tool-kg_cypher_read) (or similar for other query languages): For complex graph pattern matching or traversals when the underlying KG supports a declarative query language and such a tool is mapped. These queries must still be scoped and optimized.
    *   Follow entity relations purposefully and minimally to retrieve only necessary information.

4.  **Knowledge Graph Maintenance (Integrity, Accuracy, Timeliness)**:
    *   The KG **MUST** be kept up-to-date.
    *   Significant system changes, user decisions, PACT-System relevant events (permissions, consents, compliance checks, tool calls, identified 'pacts') **MUST** be recorded in the KG promptly.
    *   Use tools like [`CREATE_ENTITIES`](../tools/symbolic_tool_references.md#tool-create_entities), [`CREATE_RELATIONS`](../tools/symbolic_tool_references.md#tool-create_relations), [`ADD_OBSERVATIONS`](../tools/symbolic_tool_references.md#tool-add_observations) (or property updates via a dedicated update tool) to reflect new information or changes.
    *   All modifications **MUST** adhere to the defined `PACT_System_Memory_Schema` to ensure consistency and data quality.
    *   Avoid creating duplicate entities; always search for existing entities before creating new ones.

### 3.2. Approved Access Patterns (Conceptual Examples)

*   **Retrieving Agent Permissions for a Task:**
    1.  `OPEN_SPECIFIC_NODES(["Agent_ID_123"])` to get the agent entity.
    2.  Traverse `hasPermissionGrant` relations to `PermissionGrant` entities.
    3.  Filter `PermissionGrant` entities based on current `Task` or `Resource` context.
*   **Logging a User Consent Decision:**
    1.  `CREATE_ENTITIES` for a new `ConsentRecord` entity, populating its properties (user, scope, timestamp, decision).
    2.  `CREATE_RELATIONS` to link the `ConsentRecord` to the `User` and the relevant `Task` or `DataProcessingActivity`.
*   **Finding All Protocols related to 'Transparency':**
    1.  `OPEN_SPECIFIC_NODES(["TransparencyPillar_Instance"])`.
    2.  Traverse outgoing `definesProtocol` (or similar) relations to `Protocol` entities.
    3.  Alternatively: `SEARCH_NODES("type:Protocol, relatedToPillar:TransparencyPillar_Instance")`.

### 3.3. Non-Compliant Access Patterns (To Be Avoided)

1.  Invoking `READ_ENTIRE_GRAPH` or its equivalent.
2.  Executing overly broad `SEARCH_NODES` queries without type or key property filters, especially on large KGs.
3.  Attempting to load or process excessively large subgraphs without clear justification, context window management, and user awareness.
4.  Creating entities or relations that violate the `PACT_System_Memory_Schema`.
5.  Failing to update the KG after significant PACT-System relevant events or system state changes for which logging is mandated.
6.  Introducing redundant or conflicting information without proper reconciliation.

### 3.4. Verification Process for KG-Reliant Agent Responses

Before an agent formulates a response or takes an action based on information from the KG:

1.  **Identify Specific Information Needs**: Clearly define what data is required from the KG.
2.  **Formulate Targeted Queries**: Use the Keyhole Approach and appropriate symbolic tools (`SEARCH_NODES`, `OPEN_SPECIFIC_NODES`, specific query tools) to retrieve *only* the necessary data.
3.  **Validate Retrieved Data (if critical)**: Check for timeliness or consistency if the operation is highly sensitive.
4.  **Contextualize Information**: Ensure the agent correctly interprets the KG data within the current operational context.

### 3.5. Maintenance & Evolution Responsibilities

1.  **Schema Management**: The `PACT_System_Memory_Schema` must be actively maintained and versioned. Changes should be documented (e.g., in the schema definition itself or a linked changelog).
2.  **Data Accuracy**: Processes should be in place to periodically audit or validate the accuracy of critical KG data.
3.  **Instance Updates**: When PACT-System artifacts (protocols, policies, tool definitions, etc.) are created or modified, the KG must be updated to reflect these changes (e.g., new `Protocol` entities, updated `ToolMetadata` entities - see example `../docs/knowledge_management/kg_apache_age_example.md`).
4.  **Status Tracking**: Ensure `StatusReport`
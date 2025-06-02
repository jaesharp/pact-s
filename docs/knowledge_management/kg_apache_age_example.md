# Knowledge Graph Migration to Apache AGE

This document outlines the migration of the PACTS knowledge graph implementation to Apache AGE (A Graph Extension for PostgreSQL), providing guidance on interacting with the new graph database.

## Migration Overview

The PACTS system has migrated from its previous knowledge graph implementation to Apache AGE, a PostgreSQL extension that provides graph database functionality. This migration improves scalability, query performance, and standards compliance.

## Apache AGE Implementation

Apache AGE (Age of Graph Enhancement) is an extension for PostgreSQL that implements the property graph model, enabling PostgreSQL to store, manage and query graph data using the Cypher query language. It offers the reliability and ACID compliance of PostgreSQL while adding the flexibility of a graph database.

## Knowledge Graph Architecture

The PES knowledge ecosystem uses a unified graph approach with subproject segregation:

- **Single Unified Graph**: All PES data is stored in a single graph named `pes`
- **Subproject Segregation**: Each entity contains a `project` property to identify its subproject
- **Context Isolation**: Queries are constrained to specific subprojects to prevent context leakage
- **Cross-Project Analysis**: Available through explicit queries that span multiple subprojects

This approach provides both integration (unified view of all data) and isolation (clear boundaries between subprojects).

## Key Knowledge Graph Details

- **Database Technology**: PostgreSQL with Apache AGE extension
- **Query Language**: Cypher (a declarative graph query language)
- **Primary Graph**: `pes`
- **Current Version**: Apache AGE 1.3.0 with PostgreSQL 16

## Subproject Structure

The knowledge graph contains entities for the following subprojects:

- **ClipifyLive**: The macOS status bar application
- **PACTS**: The Permission, Accountability, Compliance, Transparency System
- **KGE**: The Knowledge Graph Engine components

Each entity is tagged with a `project` property identifying which subproject it belongs to.

## Entity Types

The knowledge graphs contain the following primary entity types:

| Entity Type | Description | Key Properties |
|-------------|-------------|----------------|
| Project | Major software projects | name, path, description, project |
| Component | Logical units within projects | name, path, category, description, project |
| Documentation | Documents and specifications | name, path, description, project |
| Process | Migration, extraction, or other operations | name, description, date, status, project |
| IntegrationPoint | Connection between systems | name, description, integration_type, project |
| ConfigurationFile | Configuration files | name, path, purpose, project |

## Relationship Types

| Relationship | Description |
|--------------|-------------|
| PART_OF | Entity is part of a larger entity |
| REFERENCES | Entity references another entity |
| CONNECTS | IntegrationPoint connects two entities |
| IMPLEMENTS | Entity implements functionality |
| DOCUMENTS | Entity provides documentation |
| SOURCE | Process uses entity as a source |
| DESTINATION | Process uses entity as a destination |
| WAS_PART_OF | Historical relationship (entity was part of another) |
| WAS_LOCATED_IN | Historical location |
| AFFECTED | Process affected an entity |
| FOUND_IN | Entity is found in another entity |

## Cypher Query Examples

### Subproject-Specific Queries

Query for PACTS components:
```cypher
MATCH (c:Component {project: 'PACTS'})
RETURN c
```

Find documentation related to a PACTS component:
```cypher
MATCH (c:Component {name: 'PACTS Core', project: 'PACTS'})
MATCH (c)-[:DOCUMENTS]-(d:Documentation {project: 'PACTS'})
RETURN c, d
```

### Cross-Project Queries

Find relationships between ClipifyLive and PACTS:
```cypher
MATCH (c1:Component {project: 'ClipifyLive'})
MATCH (c2:Component {project: 'PACTS'})
MATCH (c1)-[:REFERENCES]->(c2)
RETURN c1, c2
```

### Writing to the Graph

Create a new PACTS documentation entity:
```cypher
CREATE (d:Documentation {
  name: 'New Documentation',
  path: '/path/to/doc.md',
  description: 'Description of the document',
  created_date: '2025-04-02',
  project: 'PACTS'
})
RETURN d
```

Add a relationship between entities (same subproject):
```cypher
MATCH (a:Component {name: 'ComponentA', project: 'PACTS'})
MATCH (b:Component {name: 'ComponentB', project: 'PACTS'})
CREATE (a)-[:REFERENCES]->(b)
RETURN a, b
```

Add a cross-project relationship:
```cypher
MATCH (a:Component {name: 'ComponentA', project: 'ClipifyLive'})
MATCH (b:Component {name: 'ComponentB', project: 'PACTS'})
CREATE (a)-[:REFERENCES {cross_project: true}]->(b)
RETURN a, b
```

## Best Practices

1. **Maintain Project Boundaries**: Always include the `project` property in your queries
2. **Explicit Cross-Project Access**: Only access entities from other projects when specifically needed
3. **Document Integration Points**: When creating cross-project relationships, document the purpose
4. **Minimal Query Scope**: Limit the scope of queries to only what's needed
5. **Avoid Global Queries**: Never query the entire graph without project constraints
6. **Filter Early**: Apply filters as early as possible in the query pattern
7. **Use Parameters**: Use parameters instead of string concatenation for dynamic values
8. **Use Proper Indexing**: Ensure frequently queried properties are indexed

## Tools for Knowledge Graph Access

The following tools are available for interacting with the knowledge graph:

| Symbolic Name | Actual Tool | Description |
|---------------|-------------|-------------|
| READ_GRAPH | mcp_Toolbase_in_knowledge_graph_read_age_cypher | Execute read-only Cypher queries |
| WRITE_GRAPH | mcp_Toolbase_in_knowledge_graph_write_age_cypher | Execute write Cypher queries |
| CREATE_GRAPH | mcp_Toolbase_in_knowledge_graph_create_age_graph | Create a new graph |
| DROP_GRAPH | mcp_Toolbase_in_knowledge_graph_drop_age_graph | Delete a graph |
| LIST_GRAPHS | mcp_Toolbase_in_knowledge_graph_list_age_graphs | List available graphs |
| GET_SCHEMA | mcp_Toolbase_in_knowledge_graph_get_age_schema | Get graph schema information |

## Migration Considerations

When working with migrated content:

1. Previous knowledge graph queries will need to be rewritten using Cypher syntax
2. Entity and relationship types have been standardized
3. All entities now include a `project` property to identify their subproject
4. Historical data is preserved with timestamps and specific relationship types (WAS_PART_OF, WAS_LOCATED_IN)
5. Cross-project relationships are explicitly marked and documented

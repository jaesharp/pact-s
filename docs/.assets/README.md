# Documentation Assets

This directory contains assets used in the PACT-System documentation, including images, diagrams, and other supporting files.

## Directory Structure

- `images/` - Contains rendered image files used in documentation (PNG, JPEG, SVG)
- `diagrams/` - Contains source files for diagrams (e.g., draw.io, mermaid.js, PlantUML)

## Usage Guidelines

### Images

Images should be stored in the `images/` directory and organized into subdirectories based on their purpose:

- `architecture/` - System architecture diagrams
- `concepts/` - Conceptual illustrations
- `protocols/` - Protocol flow illustrations
- `screenshots/` - Application screenshots

**Naming convention:** Use descriptive, lowercase filenames with hyphens separating words and include date (YYYYMMDD) for versioned images.

Example: `knowledge-graph-structure-20250515.png`

### Diagrams

The `diagrams/` directory contains editable source files for diagrams. This allows for:

- Version tracking of diagram sources
- Easy updates and modifications
- Consistent styling across the project

**Supported formats:**
- Draw.io (`.drawio`) - For complex diagrams
- Mermaid (`.mmd`) - For simple flowcharts, sequence diagrams
- PlantUML (`.puml`) - For UML diagrams
- Other formats as needed

When possible, embed diagrams directly in Markdown using:
- Mermaid.js syntax for simple diagrams
- Links to rendered SVGs for complex diagrams

## Contributing to Assets

When adding new assets:

1. Choose the appropriate subdirectory
2. Follow naming conventions
3. For images, use web-friendly formats (PNG, SVG preferred)
4. For diagrams, include the source file and a rendered version when appropriate
5. Reference assets in documentation using relative paths 
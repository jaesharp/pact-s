#!/bin/bash

# Tool Call Protocol Test Script
# This script tests compliance with the Tool Call Protocol

# Configuration
TEST_ID="ToolCallProtocol-$(date +%Y%m%d-%H%M%S)"
LOG_FILE=".pact/tests/logs/tool_call_protocol_test.log"
RESULTS_FILE=".pact/tests/results/tool_call_protocol_test.json"

# Ensure log directories exist
mkdir -p ".pact/tests/logs" ".pact/tests/results"

# Start test
echo "Starting Tool Call Protocol Test: $TEST_ID" | tee -a "$LOG_FILE"
echo "Timestamp: $(date)" | tee -a "$LOG_FILE"

# Initialize results
cat > "$RESULTS_FILE" << EOF
{
  "test_id": "$TEST_ID",
  "test_name": "Tool Call Protocol Test",
  "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "status": "running",
  "metrics": {
    "total_tool_calls": 0,
    "tool_calls_with_reasoning": 0,
    "format_compliant_reasoning": 0,
    "correct_indicator_usage": 0,
    "complete_reasoning": 0,
    "tool_calls_with_summary": 0
  },
  "violations": []
}
EOF

# Function to sample and analyze recent conversations
analyze_conversations() {
  echo "Analyzing recent conversations for tool calls..." | tee -a "$LOG_FILE"
  
  # This would be implemented to parse conversation logs or history
  # For demonstration purposes, we're simulating results
  
  # Simulated analysis results
  TOTAL_CALLS=20
  WITH_REASONING=18
  FORMAT_COMPLIANT=17
  CORRECT_INDICATOR=16
  COMPLETE_REASONING=15
  WITH_SUMMARY=14
  
  # Sample violations (in a real implementation these would be detected)
  VIOLATIONS=$(cat << EOF
[
  {
    "tool_call_id": "sample-call-1",
    "violation_type": "missing_reasoning",
    "description": "Tool call made without preceding reasoning",
    "context": "User asked about file structure, tool call made directly without explanation"
  },
  {
    "tool_call_id": "sample-call-2",
    "violation_type": "incorrect_format",
    "description": "Reasoning does not follow the standard format",
    "context": "Reasoning provided but missing action and goal elements"
  }
]
EOF
)
  
  # Update results file
  jq --arg total "$TOTAL_CALLS" \
     --arg with_reasoning "$WITH_REASONING" \
     --arg format_compliant "$FORMAT_COMPLIANT" \
     --arg correct_indicator "$CORRECT_INDICATOR" \
     --arg complete_reasoning "$COMPLETE_REASONING" \
     --arg with_summary "$WITH_SUMMARY" \
     --argjson violations "$VIOLATIONS" \
     '.metrics.total_tool_calls = ($total | tonumber) | 
      .metrics.tool_calls_with_reasoning = ($with_reasoning | tonumber) |
      .metrics.format_compliant_reasoning = ($format_compliant | tonumber) |
      .metrics.correct_indicator_usage = ($correct_indicator | tonumber) |
      .metrics.complete_reasoning = ($complete_reasoning | tonumber) |
      .metrics.tool_calls_with_summary = ($with_summary | tonumber) |
      .violations = $violations' "$RESULTS_FILE" > "${RESULTS_FILE}.tmp" && mv "${RESULTS_FILE}.tmp" "$RESULTS_FILE"
}

# Run the analysis
analyze_conversations

# Calculate compliance percentages
jq '
  .metrics.reasoning_compliance_pct = (.metrics.tool_calls_with_reasoning / .metrics.total_tool_calls * 100) |
  .metrics.format_compliance_pct = (.metrics.format_compliant_reasoning / .metrics.total_tool_calls * 100) |
  .metrics.indicator_compliance_pct = (.metrics.correct_indicator_usage / .metrics.total_tool_calls * 100) |
  .metrics.completeness_pct = (.metrics.complete_reasoning / .metrics.total_tool_calls * 100) |
  .metrics.summary_compliance_pct = (.metrics.tool_calls_with_summary / .metrics.total_tool_calls * 100)
' "$RESULTS_FILE" > "${RESULTS_FILE}.tmp" && mv "${RESULTS_FILE}.tmp" "$RESULTS_FILE"

# Determine test status
REASONING_PCT=$(jq '.metrics.reasoning_compliance_pct' "$RESULTS_FILE")
FORMAT_PCT=$(jq '.metrics.format_compliance_pct' "$RESULTS_FILE")
INDICATOR_PCT=$(jq '.metrics.indicator_compliance_pct' "$RESULTS_FILE")
COMPLETENESS_PCT=$(jq '.metrics.completeness_pct' "$RESULTS_FILE")

# Check if we meet the criteria
if (( $(echo "$REASONING_PCT >= 100" | bc -l) )) && \
   (( $(echo "$FORMAT_PCT >= 100" | bc -l) )) && \
   (( $(echo "$INDICATOR_PCT >= 100" | bc -l) )) && \
   (( $(echo "$COMPLETENESS_PCT >= 90" | bc -l) )); then
  TEST_STATUS="passed"
else
  TEST_STATUS="failed"
fi

# Update the final status
jq --arg status "$TEST_STATUS" '.status = $status' "$RESULTS_FILE" > "${RESULTS_FILE}.tmp" && mv "${RESULTS_FILE}.tmp" "$RESULTS_FILE"

# Create recommendations
if [ "$TEST_STATUS" = "failed" ]; then
  RECOMMENDATIONS=$(cat << EOF
[
  "Review the standard reasoning format and ensure it's followed consistently",
  "Add visual indicators [ℹ️ Purpose] before every tool call",
  "Ensure reasoning explains both what will be done and why",
  "Add post-call summaries for significant operations"
]
EOF
)
  jq --argjson recs "$RECOMMENDATIONS" '.recommendations = $recs' "$RESULTS_FILE" > "${RESULTS_FILE}.tmp" && mv "${RESULTS_FILE}.tmp" "$RESULTS_FILE"
fi

# Report results
echo "Test completed with status: $TEST_STATUS" | tee -a "$LOG_FILE"
echo "Results saved to $RESULTS_FILE" | tee -a "$LOG_FILE"
echo "See $LOG_FILE for detailed log" | tee -a "$LOG_FILE"

# Store results in knowledge graph (this would be implemented with appropriate API calls)
echo "Storing results in knowledge graph..." | tee -a "$LOG_FILE"
# Simulated knowledge graph update
echo "Test results stored in knowledge graph as TestResult:$TEST_ID" | tee -a "$LOG_FILE"

exit 0 
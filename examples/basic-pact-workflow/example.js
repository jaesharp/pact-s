#!/usr/bin/env node

/**
 * Basic PACT-S Workflow Example
 * Demonstrates core PACT-S principles in action
 */

const readline = require('readline');
const fs = require('fs').promises;

// Simple action log for transparency
const actionLog = [];

// Mock protocols for demonstration
const protocols = {
  file_read: {
    name: "File Read Protocol",
    requires: ["user_consent", "file_exists", "read_permission"],
    restrictions: ["no_sensitive_files", "size_limit_10mb"]
  },
  file_write: {
    name: "File Write Protocol", 
    requires: ["user_consent", "explicit_path", "backup_exists"],
    restrictions: ["no_system_files", "no_overwrite_without_confirm"]
  }
};

// Mock agent capabilities
const agentCapabilities = ["file_analysis", "text_processing", "data_validation"];

/**
 * Request permission from user (P - Permission)
 */
async function requestPermission(action, resource) {
  console.log(`\n[PERMISSION] Requesting permission to ${action}: ${resource}`);
  
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });
  
  return new Promise((resolve) => {
    rl.question('[USER INPUT] Do you grant permission? (yes/no): ', (answer) => {
      rl.close();
      const granted = answer.toLowerCase() === 'yes';
      
      if (granted) {
        console.log('[CONSENT] User granted explicit consent');
        logAction('permission_granted', { action, resource, timestamp: new Date() });
      } else {
        console.log('[CONSENT] User denied permission');
        logAction('permission_denied', { action, resource, timestamp: new Date() });
      }
      
      resolve(granted);
    });
  });
}

/**
 * Check compliance with protocols (C - Compliance)
 */
function checkCompliance(action, protocolName) {
  console.log('[COMPLIANCE] Checking protocol compliance...');
  
  const protocol = protocols[protocolName];
  if (!protocol) {
    console.log(`[COMPLIANCE] ✗ Unknown protocol: ${protocolName}`);
    return false;
  }
  
  // Simulate compliance checking
  const compliant = true; // In real implementation, would check actual requirements
  
  if (compliant) {
    console.log(`[COMPLIANCE] ✓ Action complies with ${protocolName} protocol`);
    logAction('compliance_verified', { action, protocol: protocolName });
  } else {
    console.log(`[COMPLIANCE] ✗ Action violates ${protocolName} protocol`);
    logAction('compliance_failed', { action, protocol: protocolName });
  }
  
  return compliant;
}

/**
 * Verify agent competency (C - Competency)
 */
function verifyCompetency(requiredCapability) {
  console.log('[COMPETENCY] Verifying agent capabilities...');
  
  const hasCapability = agentCapabilities.includes(requiredCapability);
  
  if (hasCapability) {
    console.log(`[COMPETENCY] ✓ Agent has required capability: ${requiredCapability}`);
    logAction('competency_verified', { capability: requiredCapability });
  } else {
    console.log(`[COMPETENCY] ✗ Agent lacks required capability: ${requiredCapability}`);
    logAction('competency_failed', { capability: requiredCapability });
  }
  
  return hasCapability;
}

/**
 * Log actions for accountability and transparency (A & T)
 */
function logAction(type, details) {
  const entry = {
    id: actionLog.length + 1,
    type,
    details,
    timestamp: new Date().toISOString()
  };
  
  actionLog.push(entry);
  console.log(`[TRANSPARENCY] Logging ${type}...`);
}

/**
 * Execute action with full PACT-S compliance
 */
async function executeWithPACTS(action, resource, protocol, capability) {
  // P - Permission
  const hasPermission = await requestPermission(action, resource);
  if (!hasPermission) {
    console.log('[SYSTEM] Action cancelled - no user permission');
    return false;
  }
  
  // C - Compliance
  const isCompliant = checkCompliance(action, protocol);
  if (!isCompliant) {
    console.log('[SYSTEM] Action cancelled - protocol non-compliance');
    return false;
  }
  
  // C - Competency
  const isCompetent = verifyCompetency(capability);
  if (!isCompetent) {
    console.log('[SYSTEM] Action cancelled - insufficient capabilities');
    return false;
  }
  
  // Execute with transparency
  console.log(`[EXECUTION] ${action} ${resource}`);
  logAction('action_executed', { action, resource });
  
  // Simulate action
  await new Promise(resolve => setTimeout(resolve, 1000));
  
  console.log('[TRANSPARENCY] Action completed successfully');
  logAction('action_completed', { action, resource, success: true });
  
  return true;
}

/**
 * Display action log for accountability
 */
function displayActionLog() {
  console.log('\n[ACCOUNTABILITY] Full action log:');
  console.log('================================');
  actionLog.forEach(entry => {
    console.log(`${entry.timestamp} - ${entry.type}: ${JSON.stringify(entry.details)}`);
  });
}

/**
 * Main example workflow
 */
async function main() {
  console.log('=== PACT-S Example: File Analysis Task ===');
  
  // Example task: Analyze a file
  const success = await executeWithPACTS(
    'analyze file',
    'data.txt',
    'file_read',
    'file_analysis'
  );
  
  if (success) {
    console.log('\n[RESULT] Task completed successfully under PACT-S governance');
  } else {
    console.log('\n[RESULT] Task was not completed due to PACT-S requirements');
  }
  
  // Show accountability
  displayActionLog();
  
  console.log('\n=== Example Complete ===');
}

// Run the example
if (require.main === module) {
  main().catch(console.error);
}

module.exports = { executeWithPACTS, logAction };
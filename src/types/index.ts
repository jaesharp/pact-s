export interface VersionInfo {
  major: number;
  minor: number;
  patch: number;
  stability: 'alpha' | 'beta' | 'stable';
  features: string[];
  compatibleWith: string[];
}

export interface PACTSConfig {
  mode: 'strict' | 'lenient';
  logging: boolean;
  compliance: string[];
  bootstrapVersion?: string;
}

export interface VerificationResult {
  success: boolean;
  errors: string[];
  warnings: string[];
  metadata: Record<string, unknown>;
}

export interface ComplianceCheck {
  rule: string;
  status: 'pass' | 'fail' | 'warn';
  message: string;
  context: Record<string, unknown>;
}

export interface AIAssistanceRequest {
  task: string;
  context: Record<string, unknown>;
  constraints: string[];
  compliance: string[];
} 
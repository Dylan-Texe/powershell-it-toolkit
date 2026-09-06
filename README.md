# PowerShell IT Toolkit

**Project:** 003  
**Status:** Complete / Core Toolkit Built

A practical PowerShell toolkit for Windows administration, diagnostics and automation.

## Included

- System inventory through CIM
- Network health checks
- Service health checks
- Local user reporting
- Windows event collection
- System health checks
- CSV export for selected reports
- Structured PASS / CHECK / FAIL results
- Smoke-test workflow
- Transcript-based logging

## Structure

```text
powershell-it-toolkit/
├── README.md
├── scripts/
│   ├── system/
│   ├── networking/
│   ├── users/
│   ├── services/
│   ├── diagnostics/
│   └── logs/
├── docs/
├── reference/
└── tests/
```

## Design Principles

- Prefer PowerShell objects over formatted text.
- Keep scripts small and independently testable.
- Make failure states explicit.
- Use parameters instead of hard-coded targets where practical.
- Separate collection, diagnosis and presentation.
- Document what was tested and what was observed.

## Validation

The toolkit includes a smoke-test script that exercises the core inventory, service and network layers and records a transcript. Individual scripts return structured objects suitable for further automation.

## Method

**Build → test → break → investigate → fix → document.**

## Project Status

**PROJECT_001 - Windows Infrastructure Lab:** Complete / Documented  
**PROJECT_002 - Networking Lab:** Complete / Documented  
**PROJECT_003 - PowerShell IT Toolkit:** Complete / Core Toolkit Built

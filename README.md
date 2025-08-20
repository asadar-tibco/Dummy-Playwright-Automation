# Dummy Playwright Automation

A Playwright automation test suite designed for TeamCity integration and CI/CD pipeline testing.

## Project Structure

```
Dummy-Playwright-Automation/
├── tests/
│   ├── smoke/
│   │   └── smoke.spec.js      # 5 smoke test cases
│   ├── bat/
│   │   └── bat.spec.js        # 5 build acceptance test cases
│   └── uat/
│       └── uat.spec.js        # 5 user acceptance test cases
├── playwright.config.js       # Playwright configuration
├── package.json               # Node.js dependencies and scripts
└── README.md                  # This file
```

## Setup Instructions

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Install Playwright browsers:**
   ```bash
   npx playwright install
   ```

## Running Tests

### Run all tests:
```bash
npm test
# or
npx playwright test
```

### Run specific test suites:

**Smoke Tests:**
```bash
npm run test:smoke
# or
npx playwright test tests/smoke
# or
npx playwright test smoke.spec.js
```

**Build Acceptance Tests (BAT):**
```bash
npm run test:bat
# or
npx playwright test tests/bat
# or
npx playwright test bat.spec.js
```

**User Acceptance Tests (UAT):**
```bash
npm run test:uat
# or
npx playwright test tests/uat
# or
npx playwright test uat.spec.js
```

### Run tests with browser visible:
```bash
npm run test:headed
# or
npx playwright test --headed
```

### Debug tests:
```bash
npm run test:debug
# or
npx playwright test --debug
```

## Test Details

All test cases are designed for **dummy purposes only** and contain only console log messages. They are specifically created for:

- ✅ TeamCity integration testing
- ✅ CI/CD pipeline validation
- ✅ Build verification processes
- ✅ Automation framework testing

### Test Categories:

1. **Smoke Tests (5 cases)** - Basic functionality verification
2. **BAT Tests (5 cases)** - Build acceptance and critical path testing
3. **UAT Tests (5 cases)** - User acceptance and end-to-end scenarios

## TeamCity Integration

The project is configured with:
- JUnit XML reporter for TeamCity integration
- HTML reports for detailed test results
- Proper exit codes for CI/CD pipeline integration
- Parallel test execution support

## Configuration

The `playwright.config.js` includes:
- Chrome browser support only (Chromium engine)
- Screenshot on failure
- Video recording on failure
- Trace collection for debugging
- JUnit XML output for CI integration

## Notes

- All tests contain only log messages (no actual browser actions)
- Perfect for testing automation infrastructure
- Ready for TeamCity and other CI/CD tools
- Lightweight and fast execution

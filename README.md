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

### Run tests for TeamCity (no browser opening):
```bash
npm run test:teamcity
```

### Generate and view Allure reports:

**Run tests and generate Allure report:**
```bash
npm run test:allure
```

**Generate Allure report only:**
```bash
npm run allure:generate
```

**Open existing Allure report:**
```bash
npm run allure:open
```

**Serve Allure report (generate and open in one command):**
```bash
npm run allure:serve
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

## TeamCity Integration (Artifact-Based)

### **✅ Simple Setup - No Plugins Required:**

**TeamCity Build Command:**
```bash
npm run test:ci
```

**TeamCity Artifact Paths:**
```
allure-report/** => allure-report.zip
test-results/** => test-results.zip
```

### **📊 What You Get:**
- **Immediate Results**: JUnit test results in TeamCity Tests tab
- **Rich Reports**: Download allure-report.zip and open index.html
- **Console Logs**: All test execution visible in build output
- **Screenshots/Videos**: Automatically included for failed tests

### **📖 Detailed Setup Guide:**
- See `TEAMCITY_QUICK_SETUP.md` for 3-step setup
- See `TEAMCITY_INTEGRATION.md` for complete configuration guide

### **🎯 Benefits:**
- ✅ No TeamCity plugins required
- ✅ Works with any TeamCity version  
- ✅ Easy report sharing via artifact download
- ✅ Historical reports preserved automatically

## Reporting

The project includes multiple reporting options:

### **Allure Reports** (Recommended)
- Rich, interactive test reports with detailed insights
- Screenshots and videos for failed tests
- Step-by-step test execution details
- Trend analysis and historical data
- Perfect for TeamCity integration

### **JUnit XML Reports**
- Basic XML format for CI/CD integration
- Compatible with most CI/CD tools including TeamCity

### **Console Output**
- Real-time test execution logs
- Color-coded test results

## Configuration

The `playwright.config.js` includes:
- Chrome browser support only (Chromium engine)
- Allure reporter for rich test reporting
- JUnit XML reporter for CI/CD integration
- Screenshot on failure
- Video recording on failure
- Trace collection for debugging

## Notes

- All tests contain only log messages (no actual browser actions)
- Perfect for testing automation infrastructure
- Ready for TeamCity and other CI/CD tools
- Lightweight and fast execution

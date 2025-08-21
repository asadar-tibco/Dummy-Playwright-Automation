# TeamCity Artifact-Based Allure Integration

## 🎯 Artifact-Based Approach (Recommended for Simple Setup)

This approach generates Allure reports as build artifacts that can be downloaded and viewed without requiring TeamCity plugins.

### TeamCity Build Configuration:

#### Build Steps:

**Option 1: Using npm scripts (Cross-platform)**
```bash
# Build Step 1: Install dependencies
npm ci

# Build Step 2: Install browsers  
npx playwright install chromium

# Build Step 3: Run tests and generate reports
npm run test:ci
```

**Option 2: Using build scripts**

For Linux/Mac agents:
```bash
chmod +x teamcity-build.sh
./teamcity-build.sh
```

For Windows agents:
```cmd
teamcity-build.bat
```

#### Artifact Paths Configuration:
```
allure-report/** => allure-report.zip
test-results/** => test-results.zip
```

#### General Settings:
- **Build failure conditions**: Process exit code is not zero
- **Enable hanging builds detection**: Yes (20 minutes)

### TeamCity Build Features:

1. **XML Report Processing**
   - Report Type: JUnit
   - Monitoring Rules: `+:test-results/junit-results.xml`

2. **Artifact Publishing**
   - Artifact paths: `allure-report/** => allure-report.zip`
   - Publish artifacts: Always (even if build failed)

### Accessing Reports:

1. **JUnit Results**: Available immediately in TeamCity Tests tab
2. **Allure Reports**: 
   - Download `allure-report.zip` from Artifacts tab
   - Extract and open `index.html` in any web browser
   - Full interactive Allure report with all features

### Expected TeamCity Output:

✅ **Build Log**: Test execution progress and console logs  
✅ **Tests Tab**: JUnit test results with pass/fail status  
✅ **Artifacts Tab**: Downloadable allure-report.zip  
✅ **Build Status**: Success/failure based on test results  

### Sample TeamCity Build Log Output:
```
[10:30:15] 📦 Installing dependencies...
[10:30:45] 🌐 Installing Playwright browsers...
[10:31:20] 🧪 Running tests and generating Allure reports...
[10:32:15] 🔥 SMOKE TEST 1: Starting Login Functionality Check
[10:32:15] ✅ Login functionality verification completed
[10:32:16] 🔥 SMOKE TEST 2: Starting Homepage Loading Verification  
[10:32:16] ❌ SIMULATED FAILURE: Homepage took too long to load
[10:32:45] 📊 Verifying report generation...
[10:32:45] ✅ Allure report generated successfully
[10:32:45] 📁 Report location: allure-report/
[10:32:45] 🎯 Test execution completed
```

### Benefits of Artifact-Based Approach:

- ✅ **No TeamCity plugins required**
- ✅ **Works with any TeamCity version**
- ✅ **Reports accessible to anyone with build access**
- ✅ **Easy to share reports externally**
- ✅ **Historical reports preserved as build artifacts**
- ✅ **Works with both Windows and Linux agents**

### File Structure Created:
```
build-artifacts/
├── allure-report.zip          # Interactive Allure report
│   ├── index.html            # Main report page
│   ├── data/                 # Test data and results
│   └── static/               # CSS, JS, images
└── test-results.zip          # JUnit XML results
    └── junit-results.xml     # TeamCity-processed results
```

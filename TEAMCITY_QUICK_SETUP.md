# TeamCity Artifact Setup - Quick Guide

## 🚀 Simple 3-Step TeamCity Setup

### Step 1: Build Command
```bash
npm run test:ci
```

### Step 2: Artifact Paths
```
allure-report/** => allure-report.zip
test-results/** => test-results.zip
```

### Step 3: Build Features
- **XML Report Processing**: JUnit, `+:test-results/junit-results.xml`
- **Artifact Publishing**: Always publish (even on failure)

## 📋 What You Get:

1. **Immediate Results**: Test pass/fail in TeamCity Tests tab
2. **Detailed Reports**: Download allure-report.zip → open index.html
3. **Console Logs**: All test execution logs in build output
4. **Screenshots/Videos**: Included in Allure report for failed tests

## 📁 Report Contents:

**allure-report.zip contains:**
- `index.html` - Main interactive report
- Rich test execution details
- Screenshots for failed tests
- Test step breakdown
- Historical trends (if preserved)

**test-results.zip contains:**
- `junit-results.xml` - TeamCity-compatible test results

## ⚡ Quick Test:
```bash
npm run test:ci
# Check: allure-report/ folder created
# Check: test-results/junit-results.xml exists
```

✅ **No TeamCity plugins required!**  
✅ **Works with any TeamCity version!**  
✅ **Simple artifact download and view!**

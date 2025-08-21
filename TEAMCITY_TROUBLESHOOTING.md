# TeamCity Troubleshooting Guide - Reports Not Showing

## 🔍 **Issue: Reports Not Appearing in TeamCity**

### **Step 1: Verify Command Execution**
Your command is correct: `npm ci && npx playwright install chromium && npm run test:ci`

### **Step 2: Check TeamCity Artifact Configuration**

**🚨 CRITICAL: Add Artifact Paths to TeamCity**

1. **Go to your TeamCity Build Configuration**
2. **Navigate to: General Settings > Artifact paths**
3. **Add these exact paths:**
```
allure-report/** => allure-report.zip
test-results/** => test-results.zip
```

### **Step 3: Configure Build Features**

**Add XML Report Processing:**
1. **Go to: Build Features**
2. **Add Build Feature: "XML report processing"**
3. **Configure:**
   - Report type: `JUnit`
   - Monitoring rules: `+:test-results/junit-results.xml`
   - Parse out of date reports: ✅ **CHECKED**

### **Step 4: Verify Build Execution**

**Check Build Log for these outputs:**
```
✅ Should see: npm ci output
✅ Should see: playwright install output  
✅ Should see: Test execution with emoji logs
✅ Should see: "Report successfully generated to allure-report"
```

### **Step 5: Expected Results After Proper Configuration**

**TeamCity Tests Tab:**
- Should show 15 tests (8 passed, 7 failed)
- Individual test results from JUnit XML

**TeamCity Artifacts Tab:**
- `allure-report.zip` - Download and extract
- `test-results.zip` - Contains JUnit XML and screenshots

### **Step 6: Manual Verification**

**Run this command in TeamCity to verify artifacts:**
```bash
npm ci && npx playwright install chromium && npm run test:ci && ls -la allure-report/ && ls -la test-results/
```

**Expected output at end:**
```
Report successfully generated to allure-report
allure-report/
├── index.html
├── data/
└── widgets/

test-results/
├── junit-results.xml
└── [test folders with screenshots]
```

## 🎯 **Most Common Issues & Solutions:**

### **Issue 1: No Artifacts Tab**
**Solution:** Add artifact paths in General Settings > Artifact paths

### **Issue 2: No Test Results**
**Solution:** Add XML report processing build feature

### **Issue 3: Build Succeeds but No Reports**
**Solution:** Verify these directories exist after build:
- `allure-report/` folder with `index.html`
- `test-results/` folder with `junit-results.xml`

### **Issue 4: Allure Report Empty**
**Solution:** The command should output: "Report successfully generated to allure-report"

## ✅ **Quick Fix Checklist:**

1. ☐ Added artifact paths: `allure-report/** => allure-report.zip`
2. ☐ Added XML report processing for JUnit
3. ☐ Build completes without errors
4. ☐ See "Report successfully generated" in build log
5. ☐ Artifacts tab appears with downloadable files

## 🚀 **Alternative Debug Command:**

If still having issues, try this enhanced command:
```bash
npm ci && 
npx playwright install chromium && 
npm run test:ci && 
echo "=== VERIFYING ARTIFACTS ===" && 
ls -la allure-report/ && 
ls -la test-results/ && 
echo "=== END VERIFICATION ==="
```

## 📞 **Need More Help?**

If reports still don't appear:
1. Check TeamCity build log for error messages
2. Verify artifact paths are exactly: `allure-report/** => allure-report.zip`
3. Ensure XML report processing is enabled for JUnit
4. Try running the command locally first to verify it works

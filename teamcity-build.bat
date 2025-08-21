@echo off
REM TeamCity Build Script for Artifact-Based Allure Reporting (Windows)

echo === Starting Playwright Test Execution with Allure Reporting ===

REM Step 1: Install dependencies
echo 📦 Installing dependencies...
call npm ci
if %errorlevel% neq 0 exit /b %errorlevel%

REM Step 2: Install Playwright browsers (Chrome only)
echo 🌐 Installing Playwright browsers...
call npx playwright install chromium
if %errorlevel% neq 0 exit /b %errorlevel%

REM Step 3: Run tests and generate reports
echo 🧪 Running tests and generating Allure reports...
call npm run test:ci
if %errorlevel% neq 0 (
    echo ⚠️ Tests failed but continuing to generate reports...
)

REM Step 4: Verify report generation
echo 📊 Verifying report generation...
if exist "allure-report" (
    echo ✅ Allure report generated successfully
    echo 📁 Report location: allure-report/
    dir allure-report
) else (
    echo ❌ Allure report generation failed
    exit /b 1
)

REM Step 5: Display summary
echo === Build Summary ===
echo 📋 JUnit Results: test-results/junit-results.xml
echo 📊 Allure Report: allure-report/ ^(ready for artifact publishing^)
echo 🎯 Test execution completed

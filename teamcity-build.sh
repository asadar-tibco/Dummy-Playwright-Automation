#!/bin/bash
# TeamCity Build Script for Artifact-Based Allure Reporting

echo "=== Starting Playwright Test Execution with Allure Reporting ==="

# Step 1: Install dependencies
echo "📦 Installing dependencies..."
npm ci

# Step 2: Install Playwright browsers (Chrome only)
echo "🌐 Installing Playwright browsers..."
npx playwright install chromium

# Step 3: Run tests and generate reports
echo "🧪 Running tests and generating Allure reports..."
npm run test:ci

# Step 4: Verify report generation
echo "📊 Verifying report generation..."
if [ -d "allure-report" ]; then
    echo "✅ Allure report generated successfully"
    echo "📁 Report location: allure-report/"
    ls -la allure-report/
else
    echo "❌ Allure report generation failed"
    exit 1
fi

# Step 5: Display summary
echo "=== Build Summary ==="
echo "📋 JUnit Results: test-results/junit-results.xml"
echo "📊 Allure Report: allure-report/ (ready for artifact publishing)"
echo "🎯 Test execution completed"

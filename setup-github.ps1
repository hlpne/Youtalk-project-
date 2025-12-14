# GitHub Repository Setup Script
# Run this after creating the repository on GitHub

Write-Host "=== GitHub Repository Setup ===" -ForegroundColor Green
Write-Host ""

# Get repository name
$repoName = Read-Host "Enter your GitHub repository name (e.g., 'youtalk')"

if ([string]::IsNullOrWhiteSpace($repoName)) {
    Write-Host "Repository name cannot be empty!" -ForegroundColor Red
    exit 1
}

# Add remote
Write-Host "Adding remote origin..." -ForegroundColor Yellow
git remote add origin "https://github.com/hlpne/$repoName.git"

if ($LASTEXITCODE -ne 0) {
    Write-Host "Remote might already exist. Removing and re-adding..." -ForegroundColor Yellow
    git remote remove origin
    git remote add origin "https://github.com/hlpne/$repoName.git"
}

# Verify remote
Write-Host ""
Write-Host "Remote configured:" -ForegroundColor Green
git remote -v

# Push to GitHub
Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "Success! Your repository is now on GitHub:" -ForegroundColor Green
    Write-Host "https://github.com/hlpne/$repoName" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "Push failed. Make sure:" -ForegroundColor Red
    Write-Host "1. The repository '$repoName' exists on GitHub" -ForegroundColor Yellow
    Write-Host "2. You are authenticated (GitHub will prompt for credentials)" -ForegroundColor Yellow
    Write-Host "3. The repository is empty (no README, .gitignore, or license)" -ForegroundColor Yellow
}


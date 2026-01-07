# Setup Environment Files Script
# Run this script to create all necessary .env files

Write-Host "🔧 Setting up environment files..." -ForegroundColor Cyan

# 1. Backend .env
Write-Host "`n1️⃣ Creating backend/.env..." -ForegroundColor Yellow
$backendEnv = @"
MONGODB_URI=mongodb+srv://inforceb27_db_user:hwi2D0ZVAaYYdoWQ@cluster0.rnwdwg2.mongodb.net/fynd-feedback?retryWrites=true&w=majority&appName=Cluster0
GEMINI_API_KEY=AIzaSyApWCMaEvWUq3QL-DXUpcRV4KeYTArNekk
PORT=5000
NODE_ENV=development
"@

$backendEnv | Out-File -FilePath "backend\.env" -Encoding utf8 -NoNewline
Write-Host "✅ backend/.env created" -ForegroundColor Green

# 2. User Dashboard .env.local
Write-Host "`n2️⃣ Creating user-dashboard/.env.local..." -ForegroundColor Yellow
"NEXT_PUBLIC_API_URL=http://localhost:5000" | Out-File -FilePath "user-dashboard\.env.local" -Encoding utf8 -NoNewline
Write-Host "✅ user-dashboard/.env.local created" -ForegroundColor Green

# 3. Admin Dashboard .env.local
Write-Host "`n3️⃣ Creating admin-dashboard/.env.local..." -ForegroundColor Yellow
"NEXT_PUBLIC_API_URL=http://localhost:5000" | Out-File -FilePath "admin-dashboard\.env.local" -Encoding utf8 -NoNewline
Write-Host "✅ admin-dashboard/.env.local created" -ForegroundColor Green

Write-Host "`n🎉 All environment files created successfully!" -ForegroundColor Green
Write-Host "`n📋 Next steps:" -ForegroundColor Cyan
Write-Host "1. Open 3 terminals" -ForegroundColor White
Write-Host "2. Terminal 1: cd backend && npm run dev" -ForegroundColor White
Write-Host "3. Terminal 2: cd user-dashboard && npm run dev" -ForegroundColor White
Write-Host "4. Terminal 3: cd admin-dashboard && npm run dev" -ForegroundColor White
Write-Host "`n🌐 URLs:" -ForegroundColor Cyan
Write-Host "- Backend: http://localhost:5000" -ForegroundColor White
Write-Host "- User Dashboard: http://localhost:3000" -ForegroundColor White
Write-Host "- Admin Dashboard: http://localhost:3002" -ForegroundColor White

# 🚨 Quick Fix Guide

## Current Issues & Solutions

### ✅ Issue 1: Backend - MongoDB Connection (FIXED)
**Error**: `The uri parameter to openUri() must be a string, got "undefined"`

**Solution**: You need to create a `.env` file with your MongoDB connection string.

**Follow this guide**: [MONGODB_SETUP.md](./MONGODB_SETUP.md)

**Quick Steps**:
1. Go to https://www.mongodb.com/cloud/atlas/register
2. Create free cluster (M0)
3. Get connection string
4. Create `backend/.env` file:

```env
MONGODB_URI=mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/fynd-feedback?retryWrites=true&w=majority
GEMINI_API_KEY=AIzaSyApWCMaEvWUq3QL-DXUpcRV4KeYTArNekk
PORT=5000
NODE_ENV=development
```

---

### ✅ Issue 2: User Dashboard - Syntax Error (FIXED)
**Error**: `SyntaxError: Invalid or unexpected token`

**Solution**: Fixed the `layout.tsx` file encoding issue.

**Action**: The file has been updated. Just restart the dev server:
```bash
# Stop current server (Ctrl+C in terminal)
npm run dev
```

---

### ⚠️ Issue 3: Admin Dashboard - Port Already in Use
**Error**: `EADDRINUSE: address already in use :::3001`

**Cause**: Another process is using port 3001

**Solution Option 1 - Kill the process**:
```powershell
# Find process using port 3001
netstat -ano | findstr :3001

# Kill the process (replace PID with actual number from above)
taskkill /PID <PID> /F
```

**Solution Option 2 - Use different port**:
Edit `admin-dashboard/package.json`:
```json
"scripts": {
  "dev": "next dev -p 3002",  // Changed from 3001 to 3002
  ...
}
```

Then run:
```bash
npm run dev
```

Access admin dashboard at: http://localhost:3002

---

## 🎯 Recommended Startup Order

### Terminal 1 - Backend
```bash
cd d:\Intern\fynd-assessment\backend

# Make sure .env file exists with MongoDB URI
npm run dev
```

**Expected output**:
```
✅ Connected to MongoDB
🚀 Server running on port 5000
```

### Terminal 2 - User Dashboard
```bash
cd d:\Intern\fynd-assessment\user-dashboard

# Create .env.local if not exists
echo NEXT_PUBLIC_API_URL=http://localhost:5000 > .env.local

npm run dev
```

**Expected output**:
```
▲ Next.js 15.5.9
- Local: http://localhost:3000
✓ Ready in 7.1s
```

### Terminal 3 - Admin Dashboard
```bash
cd d:\Intern\fynd-assessment\admin-dashboard

# Create .env.local if not exists
echo NEXT_PUBLIC_API_URL=http://localhost:5000 > .env.local

# Option 1: Kill process on 3001 first
# Option 2: Use port 3002 (edit package.json)
npm run dev
```

**Expected output**:
```
▲ Next.js 15.5.9
- Local: http://localhost:3001 (or 3002)
✓ Ready in 7.1s
```

---

## 🧪 Testing

Once all three are running:

1. **Open User Dashboard**: http://localhost:3000
2. **Submit a review**:
   - Select 5 stars
   - Type: "Great service!"
   - Click Submit
   - Wait for AI response (2-3 seconds)
3. **Open Admin Dashboard**: http://localhost:3001 (or 3002)
4. **Verify**:
   - See your review in the table
   - Check analytics cards
   - Try "Expand" button
   - Wait 5 seconds for auto-refresh

---

## 📋 Checklist

- [ ] MongoDB Atlas cluster created
- [ ] Connection string obtained
- [ ] `backend/.env` file created
- [ ] Backend starts without errors
- [ ] User dashboard starts without errors
- [ ] Admin dashboard starts without errors
- [ ] Can submit review successfully
- [ ] Review appears in admin dashboard
- [ ] Analytics display correctly
- [ ] Auto-refresh works

---

## 🆘 Still Having Issues?

### Backend won't connect to MongoDB
- Double-check connection string format
- Make sure you replaced `<password>` with actual password
- Verify IP is whitelisted in MongoDB Atlas
- Check database name is `fynd-feedback`

### Frontend won't start
- Clear npm cache: `npm cache clean --force`
- Delete `node_modules` and reinstall: `rm -rf node_modules && npm install`
- Check for syntax errors in files

### Port conflicts
- Use `netstat -ano | findstr :PORT` to find process
- Kill process or use different port
- Make sure no other dev servers are running

---

**Next**: Once everything is running locally, proceed to deployment! 🚀

# MongoDB Atlas Setup Guide

## Quick Setup (5 Minutes)

### Step 1: Create MongoDB Atlas Account

1. Go to: https://www.mongodb.com/cloud/atlas/register
2. Sign up with:
   - Email address
   - OR Google account
   - OR GitHub account
3. Complete verification

### Step 2: Create Free Cluster

1. After login, click **"Build a Database"**
2. Choose **M0 FREE** tier:
   - 512 MB storage
   - Shared RAM
   - No credit card required
3. Select cloud provider: **AWS** (recommended)
4. Select region: Choose closest to you
5. Cluster name: `Cluster0` (default is fine)
6. Click **"Create Cluster"**

### Step 3: Create Database User

1. You'll see "Security Quickstart"
2. **Authentication Method**: Username and Password
3. Create credentials:
   - Username: `fynduser` (or your choice)
   - Password: Click "Autogenerate Secure Password" OR create your own
   - **IMPORTANT**: Save these credentials!
4. Click **"Create User"**

### Step 4: Add IP Address

1. Still in Security Quickstart
2. **Where would you like to connect from?**
3. Click **"Add My Current IP Address"**
4. OR click **"Allow Access from Anywhere"** (for testing)
   - IP: `0.0.0.0/0`
5. Click **"Finish and Close"**

### Step 5: Get Connection String

1. Click **"Connect"** button on your cluster
2. Choose **"Connect your application"**
3. Driver: **Node.js**
4. Version: **5.5 or later**
5. Copy the connection string:

```
mongodb+srv://fynduser:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority
```

### Step 6: Update Connection String

Replace `<password>` with your actual password:

```
mongodb+srv://fynduser:YourActualPassword123@cluster0.xxxxx.mongodb.net/fynd-feedback?retryWrites=true&w=majority
```

**Important changes**:
- Replace `<password>` with your password
- Add `/fynd-feedback` before the `?` (this is your database name)

### Step 7: Create .env File

1. Navigate to backend folder:
```bash
cd d:\Intern\fynd-assessment\backend
```

2. Create `.env` file (you can copy from `.env.example`):
```bash
copy .env.example .env
```

3. Edit `.env` file with your MongoDB URI:

```env
MONGODB_URI=mongodb+srv://fynduser:YourActualPassword123@cluster0.xxxxx.mongodb.net/fynd-feedback?retryWrites=true&w=majority
GEMINI_API_KEY=AIzaSyApWCMaEvWUq3QL-DXUpcRV4KeYTArNekk
PORT=5000
NODE_ENV=development
```

### Step 8: Test Connection

1. Restart your backend server:
```bash
# Stop the current server (Ctrl+C)
npm run dev
```

2. You should see:
```
✅ Connected to MongoDB
🚀 Server running on port 5000
```

## Troubleshooting

### Error: "Authentication failed"
- Check username and password are correct
- Make sure you replaced `<password>` in connection string
- Password cannot contain special characters like `@`, `:`, `/` without URL encoding

### Error: "Connection timeout"
- Check your IP is whitelisted in MongoDB Atlas
- Try "Allow Access from Anywhere" (0.0.0.0/0)
- Check your internet connection

### Error: "Database name not found"
- Make sure you added `/fynd-feedback` to the connection string
- Format: `...mongodb.net/fynd-feedback?retryWrites=...`

## Example .env File

```env
MONGODB_URI=mongodb+srv://fynduser:MySecurePass123@cluster0.abc123.mongodb.net/fynd-feedback?retryWrites=true&w=majority
GEMINI_API_KEY=AIzaSyApWCMaEvWUq3QL-DXUpcRV4KeYTArNekk
PORT=5000
NODE_ENV=development
```

## Next Steps

Once MongoDB is connected:
1. ✅ Backend will start successfully
2. ✅ Test user dashboard (http://localhost:3000)
3. ✅ Submit a review
4. ✅ Check admin dashboard (http://localhost:3001)
5. ✅ See your review appear!

---

**Need help?** The MongoDB Atlas UI is very user-friendly. Just follow the prompts!

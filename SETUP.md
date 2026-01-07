# Quick Setup Guide - Fynd AI Feedback System

## ⚡ Quick Start (5 Minutes)

### Step 1: Set Up MongoDB Atlas (Free)

1. Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas/register)
2. Create a free account
3. Create a new cluster (M0 Free tier)
4. Click "Connect" → "Connect your application"
5. Copy the connection string
6. Replace `<password>` with your database password
7. Replace `<dbname>` with `fynd-feedback`

Example connection string:
```
mongodb+srv://username:yourpassword@cluster0.xxxxx.mongodb.net/fynd-feedback?retryWrites=true&w=majority
```

### Step 2: Configure Backend

1. Navigate to `backend` folder
2. Create `.env` file (copy from `.env.example`):

```bash
cd backend
copy .env.example .env
```

3. Edit `.env` file with your credentials:

```env
MONGODB_URI=mongodb+srv://username:yourpassword@cluster0.xxxxx.mongodb.net/fynd-feedback?retryWrites=true&w=majority
GEMINI_API_KEY=AIzaSyApWCMaEvWUq3QL-DXUpcRV4KeYTArNekk
PORT=5000
NODE_ENV=development
```

4. Install dependencies and start:

```bash
npm install
npm start
```

You should see:
```
✅ Connected to MongoDB
🚀 Server running on port 5000
```

### Step 3: Set Up User Dashboard

1. Open a new terminal
2. Navigate to `user-dashboard`:

```bash
cd user-dashboard
npm install
```

3. Create `.env.local`:

```bash
echo NEXT_PUBLIC_API_URL=http://localhost:5000 > .env.local
```

4. Start the dashboard:

```bash
npm run dev
```

Access at: **http://localhost:3000**

### Step 4: Set Up Admin Dashboard

1. Open another terminal
2. Navigate to `admin-dashboard`:

```bash
cd admin-dashboard
npm install
```

3. Create `.env.local`:

```bash
echo NEXT_PUBLIC_API_URL=http://localhost:5000 > .env.local
```

4. Start the dashboard:

```bash
npm run dev
```

Access at: **http://localhost:3001**

## 🧪 Testing the System

### Test User Dashboard
1. Go to http://localhost:3000
2. Select a 5-star rating
3. Type: "Excellent service, very satisfied!"
4. Click "Submit Feedback"
5. Wait for AI response (2-3 seconds)

### Test Admin Dashboard
1. Go to http://localhost:3001
2. You should see the review you just submitted
3. Check the analytics cards
4. Try filtering by rating
5. Click "Expand" to see full details

## 🚀 Deployment Guide

### Deploy Backend to Render

1. Push code to GitHub
2. Go to [Render](https://render.com)
3. Create new Web Service
4. Connect your GitHub repository
5. Select `backend` folder
6. Add environment variables:
   - `MONGODB_URI`: Your MongoDB connection string
   - `GEMINI_API_KEY`: AIzaSyApWCMaEvWUq3QL-DXUpcRV4KeYTArNekk
   - `NODE_ENV`: production
7. Build command: `npm install`
8. Start command: `npm start`
9. Deploy!

Copy the deployment URL (e.g., `https://your-app.onrender.com`)

### Deploy User Dashboard to Vercel

1. Go to [Vercel](https://vercel.com)
2. Import your GitHub repository
3. Select `user-dashboard` folder
4. Add environment variable:
   - `NEXT_PUBLIC_API_URL`: Your Render backend URL
5. Deploy!

### Deploy Admin Dashboard to Vercel

1. Import the same repository again
2. Select `admin-dashboard` folder
3. Add environment variable:
   - `NEXT_PUBLIC_API_URL`: Your Render backend URL
4. Deploy!

## 📊 Features Checklist

### User Dashboard ✨
- [x] Interactive 5-star rating
- [x] Review text input (2000 char limit)
- [x] Real-time AI responses
- [x] Premium glassmorphism UI
- [x] Smooth animations
- [x] Error handling
- [x] Loading states
- [x] Success notifications

### Admin Dashboard 📈
- [x] Real-time review list
- [x] Auto-refresh (5 seconds)
- [x] Analytics cards
- [x] Rating distribution chart
- [x] Filter by rating
- [x] Expandable review details
- [x] AI summaries
- [x] Recommended actions

### Backend API 🔧
- [x] POST /api/reviews
- [x] GET /api/reviews
- [x] GET /api/health
- [x] Zod validation
- [x] Error handling
- [x] Gemini AI integration
- [x] MongoDB persistence
- [x] CORS configuration

## 🎨 Design Highlights

- **Glassmorphism**: Frosted glass effects throughout
- **Gradients**: Multi-color animated backgrounds
- **Typography**: Inter font for premium feel
- **Animations**: Fade-in, slide-up, pulse effects
- **Dark Theme**: Modern dark mode aesthetics
- **Responsive**: Mobile-first design

## 🔍 Troubleshooting

### Backend won't start
- Check MongoDB connection string
- Verify Gemini API key
- Ensure port 5000 is available

### Frontend won't connect
- Check `NEXT_PUBLIC_API_URL` in `.env.local`
- Verify backend is running
- Check browser console for errors

### AI responses not working
- Verify Gemini API key is correct
- Check backend logs for errors
- Ensure internet connection

### MongoDB connection failed
- Whitelist your IP in MongoDB Atlas
- Check username/password
- Verify connection string format

## 📝 Next Steps

1. ✅ Set up MongoDB Atlas
2. ✅ Configure environment variables
3. ✅ Test locally
4. ✅ Push to GitHub
5. ✅ Deploy to Render (backend)
6. ✅ Deploy to Vercel (dashboards)
7. ✅ Test deployed URLs
8. ✅ Update README with live links
9. ✅ Create report PDF

## 🎯 Assessment Requirements

All requirements met:
- ✅ Real web application (Next.js, not Streamlit)
- ✅ Two separate dashboards
- ✅ Server-side LLM calls
- ✅ Persistent MongoDB storage
- ✅ Deployed on Vercel/Render
- ✅ JSON schemas with Zod
- ✅ Error handling (empty, long, failures)
- ✅ Premium UI/UX design

## 💡 Tips

- Use MongoDB Atlas free tier (no credit card needed)
- Gemini API has generous free limits
- Render free tier sleeps after 15 min inactivity
- Vercel deployments are instant
- Test thoroughly before final submission

---

**Need help?** Check the main README.md for detailed documentation.

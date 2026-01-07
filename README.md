# Fynd AI Feedback System - Task 2

A production-ready, AI-powered two-dashboard feedback system built with Next.js, Express, MongoDB, and Google Gemini API.

## 🌟 Live Deployments

- **User Dashboard**: [Will be deployed on Vercel]
- **Admin Dashboard**: [Will be deployed on Vercel]
- **Backend API**: [Will be deployed on Render]

## 📋 Project Structure

```
fynd-assessment/
├── backend/                 # Express API server
│   ├── models/             # MongoDB schemas
│   ├── routes/             # API endpoints
│   ├── services/           # Gemini AI integration
│   └── server.js           # Main server file
├── user-dashboard/         # Next.js user-facing app
│   ├── app/               # App router pages
│   └── components/        # React components
└── admin-dashboard/        # Next.js admin app
    ├── app/               # App router pages
    └── components/        # React components
```

## 🚀 Features

### User Dashboard
- ⭐ Interactive 5-star rating system
- 📝 Review submission with character limit
- 🤖 Real-time AI-generated responses
- ✨ Premium glassmorphism UI
- 🎨 Smooth animations and transitions
- 📱 Fully responsive design

### Admin Dashboard
- 📊 Real-time analytics dashboard
- 🔄 Auto-refresh every 5 seconds
- 📈 Rating distribution charts
- 🎯 Filter by star rating
- 📋 Expandable review details
- 🤖 AI-generated summaries and action items

### Backend API
- 🔒 Server-side LLM processing
- ✅ Zod schema validation
- 🛡️ Comprehensive error handling
- 💾 MongoDB persistence
- 🔄 Graceful fallbacks for AI failures

## 🛠️ Technology Stack

- **Frontend**: Next.js 15, React 19, TypeScript, Tailwind CSS
- **Backend**: Node.js, Express, Mongoose
- **Database**: MongoDB Atlas
- **AI**: Google Gemini 2.0 Flash
- **Deployment**: Vercel (frontends), Render (backend)

## 📦 Installation & Setup

### Prerequisites
- Node.js 18+ installed
- MongoDB Atlas account (free tier)
- Google Gemini API key (free tier)

### Backend Setup

```bash
cd backend
npm install

# Create .env file
cp .env.example .env

# Add your credentials to .env:
# MONGODB_URI=your_mongodb_connection_string
# GEMINI_API_KEY=your_gemini_api_key
# PORT=5000

# Start server
npm start
```

### User Dashboard Setup

```bash
cd user-dashboard
npm install

# Create .env.local file
echo "NEXT_PUBLIC_API_URL=http://localhost:5000" > .env.local

# Start development server
npm run dev
```

Access at: http://localhost:3000

### Admin Dashboard Setup

```bash
cd admin-dashboard
npm install

# Create .env.local file
echo "NEXT_PUBLIC_API_URL=http://localhost:5000" > .env.local

# Start development server
npm run dev
```

Access at: http://localhost:3001

## 🔑 Environment Variables

### Backend (.env)
```
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/fynd-feedback
GEMINI_API_KEY=your_gemini_api_key_here
PORT=5000
NODE_ENV=development
```

### User Dashboard (.env.local)
```
NEXT_PUBLIC_API_URL=http://localhost:5000
```

### Admin Dashboard (.env.local)
```
NEXT_PUBLIC_API_URL=http://localhost:5000
```

## 📡 API Documentation

### POST /api/reviews
Submit a new review

**Request:**
```json
{
  "rating": 5,
  "reviewText": "Great service!"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "reviewId": "507f1f77bcf86cd799439011",
    "userResponse": "Thank you so much for the amazing review!...",
    "timestamp": "2026-01-07T01:30:00.000Z"
  }
}
```

### GET /api/reviews
Fetch all reviews with analytics

**Query Parameters:**
- `limit` (optional): Number of reviews to return (default: 50)
- `rating` (optional): Filter by specific rating (1-5)

**Response:**
```json
{
  "success": true,
  "data": {
    "reviews": [...],
    "total": 10,
    "analytics": {
      "totalReviews": 10,
      "averageRating": 4.2,
      "ratingDistribution": {
        "1": 0,
        "2": 1,
        "3": 2,
        "4": 3,
        "5": 4
      }
    }
  }
}
```

### GET /api/health
Health check endpoint

**Response:**
```json
{
  "status": "ok",
  "timestamp": "2026-01-07T01:30:00.000Z",
  "database": "connected",
  "llm": "available"
}
```

## 🎨 Design Features

- **Glassmorphism**: Modern frosted glass effects
- **Gradient Backgrounds**: Dynamic multi-color gradients
- **Micro-animations**: Smooth hover and transition effects
- **Dark Theme**: Premium dark mode aesthetics
- **Typography**: Inter font family for clean readability
- **Responsive**: Mobile-first design approach

## 🧪 Testing

### Manual Testing Checklist

**User Dashboard:**
- [ ] Submit review with all ratings (1-5)
- [ ] Submit with empty review text
- [ ] Submit with long review text (>2000 chars)
- [ ] Verify AI response appears
- [ ] Test error handling (no rating selected)

**Admin Dashboard:**
- [ ] Verify all reviews display
- [ ] Check auto-refresh (5 second interval)
- [ ] Test rating filters
- [ ] Expand/collapse review details
- [ ] Verify analytics calculations

**API:**
- [ ] Health check endpoint
- [ ] Review submission with validation
- [ ] Review fetching with filters
- [ ] Error handling for invalid data

## 🚢 Deployment

### Backend (Render)

1. Create new Web Service on Render
2. Connect GitHub repository
3. Set environment variables:
   - `MONGODB_URI`
   - `GEMINI_API_KEY`
   - `NODE_ENV=production`
4. Build command: `npm install`
5. Start command: `npm start`

### User Dashboard (Vercel)

1. Import project from GitHub
2. Select `user-dashboard` directory
3. Set environment variable:
   - `NEXT_PUBLIC_API_URL=https://your-backend-url.onrender.com`
4. Deploy

### Admin Dashboard (Vercel)

1. Import project from GitHub
2. Select `admin-dashboard` directory
3. Set environment variable:
   - `NEXT_PUBLIC_API_URL=https://your-backend-url.onrender.com`
4. Deploy

## 🔒 Security Features

- Server-side LLM calls only (no API key exposure)
- Input validation with Zod schemas
- CORS configuration for specific origins
- Request sanitization
- Error message sanitization

## ⚡ Performance Optimizations

- Parallel AI processing (all 3 LLM calls simultaneously)
- Database indexing on `createdAt` and `rating`
- Efficient polling with 5-second intervals
- Optimized bundle sizes with Next.js
- Lazy loading for components

## 🎯 Trade-offs & Limitations

### Current Implementation
- **Polling vs WebSockets**: Using 5-second polling for simplicity
- **No Authentication**: Open submission (can add auth later)
- **Free Tier Limits**: Gemini API (15 req/min), MongoDB (512MB)
- **No Caching**: Fresh AI responses every time

### Future Improvements
- Add user authentication
- Implement WebSocket for real-time updates
- Add response caching for common patterns
- Implement rate limiting
- Add review moderation
- Export analytics to CSV/PDF

## 📝 License

MIT

## 👨‍💻 Author

Created for Fynd AI Intern Take Home Assessment 2.0

---

**Note**: Make sure to replace placeholder URLs with actual deployment URLs after deploying.

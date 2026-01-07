# 🚀 Step-by-Step Deployment Guide

Your code is now **deployment-ready**! Follow these exact steps to make your site live.

---

## Part 1: Backend Deployment (Render.com)

1. **Push your code to GitHub.**
2. Go to **[Render Dashboard](https://dashboard.render.com)** -> New -> **Web Service**.
3. Connect your GitHub repository.
4. **Settings:**
   - **Name:** `fynd-backend` (or similar)
   - **Root Directory:** `backend` (Important!)
   - **Runtime:** `Node`
   - **Build Command:** `npm install`
   - **Start Command:** `node server.js`
   - **Free Plan:** Select expected

5. **Environment Variables** (Scroll down to "Advanced" or "Environment"):
   Add these 3 keys:

   | Key | Value |
   |-----|-------|
   | `MONGODB_URI` | `mongodb+srv://inforceb27_db_user:hwi2D0ZVAaYYdoWQ@cluster0.rnwdwg2.mongodb.net/fynd-feedback?retryWrites=true&w=majority&appName=Cluster0` |
   | `QUBID_API_KEY` | `k_48f8cc5313af.MHFx-BJqPoJFpwRPJX2djD5rE8-RbpHu6mLSe9l9_HMcIIPII5mUDg` |
   | `NODE_ENV` | `production` |

6. Click **Create Web Service**.
7. **Wait** for deployment to finish.
8. **Copy your Backend URL** (e.g., `https://fynd-backend-xyz.onrender.com`).

---

## Part 2: User Dashboard (Vercel)

1. Go to **[Vercel Dashboard](https://vercel.com/dashboard)** -> **Add New...** -> **Project**.
2. Import your GitHub repository.
3. **Configure Project:**
   - **Framework Preset:** Vite (Should detect automatically)
   - **Root Directory:** Edit to `user-dashboard`
   - **Environment Variables:**
     - Key: `VITE_API_URL`
     - Value: `https://[YOUR-RENDER-BACKEND-URL].onrender.com` (Paste URL from Part 1)

4. Click **Deploy**.
5. You will get a link like `https://fynd-user-dashboard.vercel.app`. **Save this!**

---

## Part 3: Admin Dashboard (Vercel)

1. Go to **[Vercel Dashboard](https://vercel.com/dashboard)** -> **Add New...** -> **Project**.
2. Import the **SAME** GitHub repository again.
3. **Configure Project:**
   - **Framework Preset:** Vite
   - **Root Directory:** Edit to `admin-dashboard`
   - **Environment Variables:**
     - Key: `VITE_API_URL`
     - Value: `https://[YOUR-RENDER-BACKEND-URL].onrender.com` (Paste URL from Part 1)

4. Click **Deploy**.

---

## 🚀 You are Live!

- **User Dashboard:** Share this link with users to collect reviews.
- **Admin Dashboard:** Keep this link private for your team.

### Testing
1. Open your new User Dashboard link.
2. Submit a review.
3. Open your Admin Dashboard link.
4. Verify the review appears with AI suggestions!

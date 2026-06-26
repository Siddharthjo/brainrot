# Frontend

**React + Lovable dashboard for Brainrot Content OS**

## Purpose

The frontend is the user interface layer. It provides:

- **Dashboard**: Central hub for managing channels and content
- **Navigation**: Multi-channel workspace switching
- **Data Visualization**: Analytics, performance tracking
- **Forms**: Channel creation, settings, approvals
- **Real-time Updates**: WebSocket connections for live updates

## Structure

```
frontend/
├── src/
│   ├── main.jsx             # App entry point
│   ├── App.jsx              # Root component
│   ├── index.css            # Global styles
│   ├── components/          # Reusable components
│   │   ├── Dashboard/
│   │   ├── Channels/
│   │   ├── Research/
│   │   ├── Scripts/
│   │   ├── Videos/
│   │   ├── Publishing/
│   │   ├── Analytics/
│   │   └── Common/          # Buttons, modals, etc
│   ├── pages/               # Page components
│   │   ├── LoginPage.jsx
│   │   ├── DashboardPage.jsx
│   │   ├── ChannelPage.jsx
│   │   ├── AnalyticsPage.jsx
│   │   └── SettingsPage.jsx
│   ├── services/            # API clients
│   │   ├── api.js           # Axios/fetch setup
│   │   ├── auth.js
│   │   ├── channels.js
│   │   ├── research.js
│   │   └── analytics.js
│   ├── hooks/               # Custom React hooks
│   │   ├── useAuth.js
│   │   ├── useChannel.js
│   │   └── useAnalytics.js
│   ├── store/               # State management (if needed)
│   └── utils/               # Helper functions
├── public/                  # Static assets
├── package.json             # Dependencies
├── vite.config.js           # Vite configuration
├── .env.example             # Example environment variables
└── README.md               # This file
```

## Key Responsibilities

- ✅ **Only display data**, never make business decisions
- ✅ **API calls only** (no hardcoded data)
- ✅ **Responsive design** (works on mobile, tablet, desktop)
- ✅ **Do not implement business logic** (that's the backend's job)
- ✅ **Beautiful, not complex** (Lovable handles this)

## Development

```bash
npm install
npm run dev
```

## Build

```bash
npm run build
```

## Architecture

- **Framework**: React 18+
- **Styling**: Tailwind CSS (via Lovable)
- **State**: Context API or Zustand
- **API Communication**: Axios
- **Build Tool**: Vite

## Key Principle

This is a dashboard client, not a SPA framework. It calls the backend for everything.

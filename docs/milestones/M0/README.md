# Milestone 0 — Technology Validation

**Goal**: Validate every external dependency before building.

**Duration**: 3–5 days

**Status**: 🔄 In Progress

**Started**: June 26, 2026

---

## Overview

Before writing any code, we test every external service and technology choice.

This prevents discovering critical issues at week 10 when we're already deep in implementation.

**Note:** During M0, an extended discussion about production format (which started as "gameplay vs. documentary vs. AI cinematic") converged into a full architecture freeze — see `docs/03-architecture.md` and Decisions #13–#17. That work is separate from this milestone's technology-validation tasks below, but happened in parallel and is now locked. M0's remaining tasks (provider selection) execute *within* that frozen architecture rather than informing it.

---

## Tasks

### M0-T01: Video Generation Provider Comparison

**Objective**: Evaluate video generation platforms for quality, API, cost, and automation.

**Candidates**:
- AutoShorts
- StoryShort  
- Creatomate
- Shotstack
- BigMotion AI
- InVideo AI

**Testing Protocol**:
1. Take the same script (provided in `/docs/M0/test-script.txt`)
2. Generate a video on each platform
3. Compare:
   - Visual quality (1-10 rating)
   - Caption animations
   - B-roll relevance
   - Rendering speed
   - API documentation
   - Cost per video
   - Customization options
   - Commercial licensing

**Deliverable**: Comparison table in `/docs/M0/video-providers.md`

**Status**: ⏳ Not Started

---

### M0-T02: Voice Generation Provider Comparison

**Objective**: Find the best TTS (text-to-speech) provider.

**Candidates**:
- ElevenLabs
- Google Cloud TTS
- Cartesia
- OpenAI TTS

**Testing Protocol**:
1. Generate voiceovers for the same script
2. Compare:
   - Voice quality (naturalness, accents, clarity)
   - Voice variety (number of voices)
   - Cost per minute
   - API latency
   - Voice cloning (if supported)
   - Commercial usage rights

**Deliverable**: Comparison table in `/docs/M0/voice-providers.md`

**Status**: ⏳ Not Started

---

### M0-T03: API Testing

**Objective**: Verify that all critical APIs work as expected.

**APIs to Test**:
- YouTube Data API (video upload, metadata)
- Meta Graph API (Instagram posting)
- OpenAI API (GPT model access)
- News API / web search capability

**Testing Protocol**:
1. Authenticate with each API
2. Test basic operations
3. Verify rate limits
4. Check error handling
5. Document any gotchas

**Deliverable**: API test results in `/docs/M0/api-testing.md`

**Status**: ⏳ Not Started

---

### M0-T04: Storage Testing

**Objective**: Verify Cloudflare R2 for storing generated videos and assets.

**Testing Protocol**:
1. Set up R2 bucket
2. Upload a test video file
3. Verify S3 compatibility
4. Test performance and retrieval
5. Calculate estimated costs

**Deliverable**: Storage test report in `/docs/M0/storage-testing.md`

**Status**: ⏳ Not Started

---

### M0-T05: Cost Estimation

**Objective**: Calculate expected API costs at different scales.

**Calculate For**:
- 1 video/day (30/month)
- 2 videos/day (60/month)
- 3 videos/day (90/month)

**Costs to Include**:
- Video generation API
- Voice generation TTS
- LLM API calls (research, script generation, review)
- Storage (Cloudflare R2)
- YouTube / Instagram API usage

**Deliverable**: Cost analysis in `/docs/M0/cost-estimation.md`

**Status**: ⏳ Not Started

---

### M0-T06: Local Development Environment

**Objective**: Ensure all development tools are working.

**Checklist**:
- [ ] Python 3.11+ installed
- [ ] Node.js 18+ installed
- [ ] PostgreSQL 15+ running
- [ ] Redis 7+ running
- [ ] Docker installed (optional but recommended)
- [ ] Git configured
- [ ] IDE (VS Code) with extensions

**Commands to Test**:
```bash
python --version
node --version
psql --version
redis-cli ping
docker --version
```

**Deliverable**: Environment setup confirmation

**Status**: ⏳ Not Started

---

## Test Scripts & Documents

All test scripts and expected outputs:

- `/docs/M0/test-script.md` — Standard test script for video generation
- `/docs/M0/video-providers.md` — Comparison table
- `/docs/M0/voice-providers.md` — Comparison table
- `/docs/M0/api-testing.md` — API test results
- `/docs/M0/storage-testing.md` — Storage test report
- `/docs/M0/cost-estimation.md` — Cost analysis

---

## Decisions Made During M0

Update `/DECISIONS.md` with:

**Decision #18 — Video Provider Choice**
- Chosen: [Creatomate / Shotstack / JSON2Video — desk research narrowed to these 3, hands-on test pending]
- Reason: [Why this one?]
- Cost: [Per video estimate]

**Decision #19 — Voice Provider Choice**
- Chosen: [ElevenLabs / Google TTS / Cartesia]
- Reason: [Why this one?]
- Cost: [Per minute estimate]

---

## Success Criteria for M0

✅ All technology choices validated
✅ No surprises when we start coding
✅ Cost model understood
✅ APIs tested and working
✅ All decisions documented

---

## Notes

- **Don't overthink**: We're validating, not perfecting
- **If a platform sucks, eliminate it**: We have alternatives
- **Document everything**: Future us will thank you
- **Test with real outputs**: Marketing pages lie; actual results don't

---

## Next Steps

Once M0 is complete:
1. Lock all technology decisions in `/DECISIONS.md`
2. Move to M1 (Planning & Architecture)
3. Never change these decisions without a very good reason

---

Last Updated: June 26, 2026
Status: Just Started

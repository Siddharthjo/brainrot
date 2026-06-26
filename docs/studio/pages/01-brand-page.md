# Page 01 — Brand Management

**Status:** Frozen enough for V1. Lovable prompt pending — build next session.
**Phase:** 1 (Studio Foundation) / 2 (Brand Configuration)

---

## 1. Why does this page exist?

Configure how a single content brand behaves — its identity, its active creative engines, and its operational status. This is the root object every other Studio page hangs off of (Research, Ideas, Approvals, Publishing, Analytics all scope to a brand).

## 2. What can the user do?

- Create Brand
- Edit Brand (name, niche, description)
- Pause Brand (stops new generation, doesn't delete anything)
- Resume Brand
- Duplicate Brand (copies config, not content)
- Archive Brand (soft-delete, recoverable)
- View Brand (read-only summary card on the main Brands list)

**Explicitly not on this page:** hard Delete. Destructive actions live in Settings with a confirmation flow.

## 3. What information is displayed?

- Brand Name, Niche / Description
- Status (Active / Paused / Archived)
- Connected Platform Accounts (read-only summary, links to manage)
- Active Visual Style, Active Voice (current preset selections)
- Posting Schedule
- Videos Generated (lifetime count)
- Last Published (timestamp + link)
- Pending Approvals (count, direct link to Approval queue)

## 4. What settings exist?

The Brand page shows **which preset is selected** per engine — it does not contain each engine's full configuration (that lives on each engine's own page, Phase 3).

- Brand Name, Niche/Description (free text)
- Status toggle (Active/Paused)
- Approval Mode: Mode A (review every Scene Blueprint) vs. Mode B (autonomous) — per Decision #16
- Posting Schedule (frequency + time)
- Active engine presets: Visual [dropdown], Voice [dropdown], Caption [dropdown], Hook [dropdown] — **extension point: these dropdowns are backed by a `presets` table, not hardcoded values**, so future AI auto-selection (Phase 9–10) is just another row, not a UI change.
- Connected Accounts (links out to a dedicated OAuth connection flow, not inline on this page)

## 5. What backend does it require?

```
GET    /brands                 — list all brands
POST   /brands                 — create a brand
GET    /brands/{id}            — get one brand's full detail
PATCH  /brands/{id}            — update brand fields
DELETE /brands/{id}            — archive (soft delete)
POST   /brands/{id}/duplicate  — clone brand config
POST   /brands/{id}/pause
POST   /brands/{id}/resume
```

## 6. External integrations

None directly — this page is configuration/orchestration only. Links to other pages handle OAuth (Connect Accounts) and engine-specific provider calls (Visual/Voice Engine pages).

## 7. Database tables

```
brands
  id, name, niche, description, status, approval_mode,
  posting_frequency, posting_time, created_at, updated_at

brand_settings
  brand_id (FK), active_visual_preset_id, active_voice_preset_id,
  active_caption_preset_id, active_hook_preset_id

brand_accounts
  brand_id (FK), platform (youtube/instagram), handle, connected_at, status

presets   -- extension point table, referenced by brand_settings
  id, engine_type (visual/voice/caption/hook), name, config (JSONB), is_default
```

## 8. Lovable prompt

**Pending.** Written in the next building session, lean-first-pass scope only (enough fields to create a brand and move to Configure — not full depth on every option yet, per the vertical-slice strategy).

---

Last Updated: June 26, 2026

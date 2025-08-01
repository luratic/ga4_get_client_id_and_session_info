# GTM Custom Variable Template – Get GA4 Client ID & Session Info (via API)

This is a custom variable template for Google Tag Manager that safely retrieves the **GA4 Client ID**, **Session ID**, or **Session Number** using the native `readAnalyticsStorage` API.

---

## What this template does

With this variable, you can:
- Get the **GA4 Client ID** for user-level identification.
- Access the **Session ID** or **Session Number** tied to a specific GA4 Measurement ID.
- Use this data for custom events, server-side tagging, or debugging.

> Requires `analytics_storage` to be available (e.g., user has granted consent via Consent Mode).

---
## How to use it
<img width="905" height="651" alt="image" src="https://github.com/user-attachments/assets/573e85a9-f440-4068-86c3-7fba278f6b2c" />

1. **Import** the `.tpl` file into your GTM container.
2. **Select** the value you want to return:
   - `Client ID`
   - `Session ID`
   - `Session Number`
3. If you choose a session-based value, **enter your GA4 Measurement ID** (e.g. `G-XXXXXXX`).
4. **Use the variable** in your tags or scripts, for example:
   - Sending enriched data via Measurement Protocol
   - Debugging session/user attribution

---

## Permissions required
- `read_analytics_storage` – To read the GA4-related cookies via GTM's secure API.

---

## 📘 Reference
Official GTM API docs (readAnalyticsStorage):  
https://developers.google.com/tag-platform/tag-manager/templates/api#readanalyticsstorage

---
## 🙋 Need help?

Feel free to reach out via [LinkedIn](https://www.linkedin.com/in/braiscalvo/), or open an issue on this repository.

---

## A/B Test 1: Single-Step vs Multi-Step Review Creation Flow
**User Story Number:** US[X] (Review Creation)
**Metrics:** Engagement — DAU, average reviews written per user per week
**Hypothesis:** Users who see a single-step review form (title, rating, and text all on one screen) will complete more reviews than users who go through a multi-step flow. The bottleneck is form abandonment mid-way through multi-step flows, which reduces weekly reviews written per user.
**Experiment:** 50% of users see the current multi-step review form, 50% see a condensed single-screen form. Tracked via Firebase Analytics — log a `review_started` event and a `review_completed` event to measure drop-off rate and completion rate per variant.
**Variations:**
- Variant A (control): Multi-step review form (current design)
- Variant B (test): Single-screen review form with all fields visible at once

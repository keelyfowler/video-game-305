## A/B Test 1: Single-Step vs Multi-Step Review Creation Flow
**User Story Number:** US[X] (Review Creation)
**Metrics:** Engagement — DAU, average reviews written per user per week
**Hypothesis:** Users who see a single-step review form (title, rating, and text all on one screen) will complete more reviews than users who go through a multi-step flow. The bottleneck is form abandonment mid-way through multi-step flows, which reduces weekly reviews written per user.
**Experiment:** 50% of users see the current multi-step review form, 50% see a condensed single-screen form. Tracked via Firebase Analytics — log a `review_started` event and a `review_completed` event to measure drop-off rate and completion rate per variant.
**Variations:**
- Variant A (control): Multi-step review form (current design)
- Variant B (test): Single-screen review form with all fields visible at once

## **A/B Test 2:** Account Creation/Sign In on 1 Screen or 2 Screens
**User Story Number:** US1 (Account Creation), US2 (Login)
**Metrics:** Adoption — adoption rate (new signups)
**Hypothesis:** New users who encounter separate sign up and sign in screens 
may abandon the flow if they land on the wrong screen and have to navigate 
to find the right one. This friction at the entry point of the app directly 
reduces our adoption rate. We hypothesize that combining sign up and sign in 
onto a single screen with a simple toggle will reduce drop-off during account 
creation and increase the number of users who successfully complete signup.

**Experiment:** We will split new users 50/50 — half will see the current 
two-screen flow (separate sign up and sign in pages), and half will see a 
single combined screen with a toggle between the two flows. We chose a 50/50 
split because our user base is small and we want equal data from both groups. 
Firebase Authentication will track signup completion events. Firebase Analytics 
will log a `signup_screen_viewed` event and a `signup_completed` event per 
variant so we can compare drop-off rates between the two groups.

**Variations:**
- Variant A (control): Separate sign up and sign in screens — user must 
  navigate between two distinct pages
- Variant B (test): Single combined screen with a toggle button to switch 
  between sign up and sign in fields

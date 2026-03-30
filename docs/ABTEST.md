## A/B Test: Single-Step vs Multi-Step Review Creation Flow
**A/B Test Name:** Single-Step vs Multi-Step Review Creation Flow
**User Story Number:** US4 (Golden Path)
**Metrics:** Engagement — DAU, average reviews written per user per week

**Hypothesis:** Users who start writing a review but encounter a multi-step 
form may abandon the flow before completing it. This drop-off reduces the 
average number of reviews written per user per week, which directly hurts 
engagement. We hypothesize that showing all review fields on a single screen 
will reduce abandonment and increase the number of completed reviews per 
active user.

**Experiment:** We will split users 50/50 — half will see the current 
multi-step review form, half will see a single-screen form with all fields 
(game title, platform, rating, review text) visible at once. We chose a 50/50 
split to get equal data from both groups. Firebase Analytics will log a 
`review_started` event when a user opens the review form and a 
`review_completed` event when they submit it. We will compare completion 
rates and weekly reviews written per user across both variants.

**Variations:**
- Variant A (control): Multi-step review form — user moves through multiple 
  screens to complete a review
- Variant B (test): Single-screen review form with all fields visible and 
  accessible at once
  

## **A/B Test:** Account Creation/Sign In on 1 Screen or 2 Screens
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


## A/B Test: Profile Setup Prompted vs Skippable During Onboarding

**A/B Test Name:** Profile Setup Prompted vs Skippable During Onboarding

**User Story Number:** US4 (Golden Path)

**Metrics:** Task Success — average number of reviews posted per active user

**Hypothesis:** Users who skip profile setup during onboarding are less likely 
to complete the full golden path (signup → profile → review a game). Skipping 
profile creation creates a gap in the flow that makes it harder for users to 
feel set up and ready to post their first review. We hypothesize that prompting 
users to complete their profile during onboarding — even if they can still 
dismiss it — will increase the percentage of users who go on to post their 
first review.

**Experiment:** We will split new users 50/50 — half will go through the 
current onboarding where profile setup can be fully skipped, half will see 
a prompted profile setup screen with a clear call to action that is 
dismissible but visible. Firebase Analytics will track 
`signup_complete`, `profile_complete`, and `review_posted` events per variant 
so we can measure how many users in each group complete the full golden path.

**Variations:**
- Variant A (control): Profile setup is fully skippable during onboarding
- Variant B (test): Profile setup screen is shown with a clear CTA during 
  onboarding, dismissible but not hidden


## A/B Test: Generic Home Screen vs Personalized Welcome Back Feed

**A/B Test Name:** Generic Home Screen vs Personalized "Welcome Back" Feed

**User Story Number:** US5 (Additional Feature)

**Metrics:** Retention — 7-day / 30-day retention rate

**Hypothesis:** Users who return to a generic home screen with no personalized 
content have little immediate reason to re-engage with the app. This lack of 
a hook at the entry point is likely contributing to low return rates. We 
hypothesize that showing returning users a personalized feed of recent friend 
activity and games they have logged will give them a reason to keep coming 
back, increasing both 7-day and 30-day retention rates.

**Experiment:** We will split returning users 50/50 — half will see the 
standard default home screen, half will see a personalized "Welcome Back" 
feed. Firebase Analytics session events will track whether users in each 
group return to the app within 7 days and 30 days of their last session. 
We will compare retention rates between the two variants to determine if 
the personalized feed has a meaningful impact on return behavior.

**Variations:**
- Variant A (control): Default home screen shown to all returning users
- Variant B (test): Personalized "Welcome Back" feed showing recent friend 
  activity and the user's recently logged games

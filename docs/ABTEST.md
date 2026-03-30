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


## A/B Test: Account Creation/Sign In on 1 Screen or 2 Screens
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
Firebase Analytics will track `sign_up` and `login` events per variant so we 
can compare drop-off rates between the two groups.

**Variations:**
- Variant A (control): Separate sign up and sign in screens — user must 
  navigate between two distinct pages
- Variant B (test): Single combined screen with a toggle button to switch 
  between sign up and sign in fields


## A/B Test: Profile Setup Skip Button Visible vs Hidden During Onboarding

**A/B Test Name:** Profile Setup Skip Button Visible vs Hidden During Onboarding

**User Story Number:** US4 (Golden Path)

**Metrics:** Task Success — percentage of users who complete the full golden 
path (signup → profile → review a game)

**Hypothesis:** Users who are given the option to skip profile setup during 
onboarding are more likely to abandon the golden path before posting their 
first review. By hiding the skip button for half of users, we force them 
through profile setup, which we hypothesize will increase the percentage of 
users who go on to complete the full golden path.

**Experiment:** We will split new users 50/50 using Firebase Remote Config 
with a boolean parameter `skip_goes_to_landing`. Users assigned `true` will 
see the skip button on the profile setup screen and can navigate directly to 
the feed without completing their profile. Users assigned `false` will not 
see the skip button and must complete profile setup to continue. Firebase 
Analytics will track `sign_up`, `PROFILE_CREATION_FINISH_PROFILE_BTN_ON_T`, 
and `first_visit` events per variant so we can measure how many users in each 
group complete the full golden path.

**Variations:**
- Variant A (control): Skip button hidden — `skip_goes_to_landing = false` — 
  user must complete profile setup to proceed
- Variant B (test): Skip button visible — `skip_goes_to_landing = true` — 
  user can skip profile setup and navigate directly to the feed


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
feed. Firebase Analytics `session_start` and `user_engagement` events will 
track whether users in each group return to the app within 7 days and 30 days 
of their last session. We will compare retention rates between the two variants 
to determine if the personalized feed has a meaningful impact on return behavior.

**Variations:**
- Variant A (control): Default home screen shown to all returning users
- Variant B (test): Personalized "Welcome Back" feed showing recent friend 
  activity and the user's recently logged games

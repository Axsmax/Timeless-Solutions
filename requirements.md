# Timeless Solutions Requirements

## Profile Approval
- Use an `approved` boolean column on the `profiles` table to track account approval.
- New profiles default to `approved = false` and gain full access once an admin sets it to true.
- The login flow queries `approved` and denies access when it is not set.

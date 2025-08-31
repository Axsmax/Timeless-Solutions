-- Profiles table schema using `approved` boolean for account approval
create table if not exists profiles (
  id uuid references auth.users on delete cascade primary key,
  role text not null,
  approved boolean not null default false,
  is_paid boolean not null default false
);

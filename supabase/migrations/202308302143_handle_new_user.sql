-- Creates a trigger function to insert a corresponding profile row for new auth.users
create or replace function public.handle_new_user()
returns trigger
security definer set search_path=public as $$
begin
  insert into public.profiles (id, role, approved, is_paid)
  values (new.id,
          coalesce(new.raw_user_meta_data->>'role','contractor'),
          false,
          false);
  return new;
end;
$$ language plpgsql;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
after insert on auth.users
for each row execute function public.handle_new_user();

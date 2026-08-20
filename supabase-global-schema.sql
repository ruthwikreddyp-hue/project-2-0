-- Project 2.0 global content library
create table if not exists public.project20_admins (
  user_id uuid primary key references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);

create table if not exists public.global_exercises (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  demo_url text,
  is_active boolean not null default true,
  updated_at timestamptz not null default now()
);

create table if not exists public.global_foods (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  base numeric not null default 100,
  unit text not null default 'g',
  prot numeric not null default 0,
  carb numeric not null default 0,
  fat numeric not null default 0,
  cal numeric not null default 0,
  is_active boolean not null default true,
  updated_at timestamptz not null default now()
);

alter table public.project20_admins enable row level security;
alter table public.global_exercises enable row level security;
alter table public.global_foods enable row level security;



create or replace function public.project20_is_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists(select 1 from public.project20_admins where user_id = auth.uid());
$$;

create or replace function public.project20_set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists global_exercises_updated_at on public.global_exercises;
create trigger global_exercises_updated_at before update on public.global_exercises for each row execute function public.project20_set_updated_at();
drop trigger if exists global_foods_updated_at on public.global_foods;
create trigger global_foods_updated_at before update on public.global_foods for each row execute function public.project20_set_updated_at();

-- Everyone can read the shared library. Only listed admins can write.
drop policy if exists "global_exercises_public_read" on public.global_exercises;
create policy "global_exercises_public_read" on public.global_exercises for select using (true);
drop policy if exists "global_exercises_admin_write" on public.global_exercises;
create policy "global_exercises_admin_write" on public.global_exercises for all using (public.project20_is_admin()) with check (public.project20_is_admin());

drop policy if exists "global_foods_public_read" on public.global_foods;
create policy "global_foods_public_read" on public.global_foods for select using (true);
drop policy if exists "global_foods_admin_write" on public.global_foods;
create policy "global_foods_admin_write" on public.global_foods for all using (public.project20_is_admin()) with check (public.project20_is_admin());

drop policy if exists "admins_read_self" on public.project20_admins;
create policy "admins_read_self" on public.project20_admins for select using (user_id = auth.uid());

-- To grant yourself admin access, first create your Project 2.0 account, then run:
-- insert into public.project20_admins(user_id) values ('YOUR-SUPABASE-USER-UUID');

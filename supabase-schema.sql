-- Project 2.0 cloud sync table.
-- Run this in Supabase SQL Editor once.
create table if not exists public.user_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.user_data enable row level security;

create policy "Users can read their own Project 2.0 data"
on public.user_data for select
using (auth.uid() = user_id);

create policy "Users can insert their own Project 2.0 data"
on public.user_data for insert
with check (auth.uid() = user_id);

create policy "Users can update their own Project 2.0 data"
on public.user_data for update
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

-- Schema `space` already exists in drp-infra-postgres. Do not CREATE EXTENSION.
-- Qualify the schema so Flyway cannot land tables elsewhere.

CREATE TABLE space.spaces (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name        VARCHAR(200) NOT NULL,
  kind        VARCHAR(32) NOT NULL CHECK (kind IN (
                'WORKSTATION', 'MEETING_ROOM', 'PRIVATE_OFFICE',
                'TRAINING_ROOM', 'AUDITORIUM'
              )),
  description TEXT,
  capacity    INTEGER NOT NULL CHECK (capacity > 0),
  active      BOOLEAN NOT NULL DEFAULT TRUE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  deleted_at  TIMESTAMPTZ
);

CREATE TABLE space.blocked_periods (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  space_id   UUID NOT NULL REFERENCES space.spaces(id),
  start_at   TIMESTAMPTZ NOT NULL,
  end_at     TIMESTAMPTZ NOT NULL,
  reason     VARCHAR(500),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CHECK (end_at > start_at)
);

CREATE INDEX idx_blocked_periods_space_range
  ON space.blocked_periods (space_id, start_at, end_at);

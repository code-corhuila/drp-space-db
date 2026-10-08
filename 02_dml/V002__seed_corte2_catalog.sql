-- Corte 2 catalog fixtures matching drp-front synthetic IDs.
-- Do not cherry-pick this version onto qa/main; replace with product catalog later.

INSERT INTO space.spaces (id, name, kind, description, capacity, active)
VALUES
  (
    '11111111-1111-1111-1111-111111111111',
    'Sala Norte',
    'MEETING_ROOM',
    'Sala de reuniones · 8 personas',
    8,
    TRUE
  ),
  (
    '22222222-2222-2222-2222-222222222222',
    'Workstation 12',
    'WORKSTATION',
    'Puesto individual',
    1,
    TRUE
  ),
  (
    '77777777-7777-7777-7777-777777777777',
    'Auditorio Central',
    'AUDITORIUM',
    'Bloqueado en el fixture de Corte 2',
    80,
    FALSE
  );

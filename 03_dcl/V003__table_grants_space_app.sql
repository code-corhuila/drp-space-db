GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA space TO space_app;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA space TO space_app;
-- No DELETE: spaces.deleted_at is the soft-delete path.

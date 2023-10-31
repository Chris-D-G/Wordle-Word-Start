-- **************************************************************
-- This script destroys the database and associated users
-- **************************************************************

-- The following line terminates any active connections to the database so that it can be destroyed
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'wordle_word_list';

DROP DATABASE wordle_word_list;

DROP USER final_capstone_owner;
DROP USER final_capstone_appuser;

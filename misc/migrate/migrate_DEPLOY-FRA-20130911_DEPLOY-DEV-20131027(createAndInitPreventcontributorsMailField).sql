ALTER TABLE fra_user ADD preventcontributorsemails boolean;
UPDATE fra_user SET preventcontributorsemails=FALSE;
-- 2_contraintes.sql
-- Validation constraints for the Esports Database

-- A round number cannot be negative or zero
ALTER TABLE Round_number ADD CONSTRAINT chk_round_number CHECK (id_round > 0);

-- A match final score cannot be negative
ALTER TABLE Match_Event ADD CONSTRAINT chk_final_score CHECK (Final_Score >= 0);

-- A player's alias must be at least 2 characters long
ALTER TABLE Player ADD CONSTRAINT chk_alias_length CHECK (LENGTH(Alias) >= 2);

-- A tournament start date must make logical sense (e.g., after the year 2000)
ALTER TABLE Tournament ADD CONSTRAINT chk_start_date CHECK (Start_Date >= '2000-01-01');
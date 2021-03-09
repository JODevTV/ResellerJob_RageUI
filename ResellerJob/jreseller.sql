INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_reseller', 'reseller', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_reseller', 'reseller', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_reseller', 'reseller', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('reseller', 'Little Pricks', 1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('reseller', 0, 'novice', 'Recrue', 100, '', ''),
('reseller', 1, 'experimente', 'Experimenté', 100, '', ''),
('reseller', 2, 'boss', 'Gérant', 100, '', '');
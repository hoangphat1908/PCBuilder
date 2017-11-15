USE `db`;

SET FOREIGN_KEY_CHECKS=0;
truncate `build_ram`;
truncate `build_storage`;
truncate `post_build`;
truncate `comment`;
truncate `post`;
truncate `build`;
truncate `user`;
truncate `component`;
truncate `cpu`;
truncate `motherboard`;
truncate `gpu`;
truncate `psu`;
truncate `ram`;
truncate `storage`;
truncate `cooler`;
truncate `computer_case`;
SET FOREIGN_KEY_CHECKS=1;

INSERT INTO `cpu` (name, manufacturer, price, cores, clock_speed, TDP)
VALUES
    ('Intel Core i7-7700K', 'Intel', 318.34, 4, 4.2, 91),
    ('AMD Ryzen 5 1600', 'AMD', 193.44, 6, 3.2, 65),
    ('Intel Core i7-8700K', 'Intel', 414.89, 6, 3.7, 65);

INSERT INTO `motherboard` (name, manufacturer, price, form_factor, socket, ram_slots, ram_max)
VALUES
    ('MSI Z270-A PRO', 'MSI', 89.88, 'ATX', 'LGA1151', 4, 64),
    ('Asus STRIX Z270-E GAMING', 'Asus', 189.88, 'ATX', 'LGA1151', 4, 64),
    ('MSI B250M PRO-VD', 'MSI', 52.39, 'Micro ATX', 'LGA1151', 2, 32);
    
INSERT INTO `gpu` (name, manufacturer, price, series, chipset, memory, core_clock)
VALUES
    ('MSI GTX 1050 Ti GAMING X 4G', 'MSI', 174.99, 'GAMING X 4G', 'GeForce GTX 1050 Ti', 4, 1.29),
    ('Asus STRIX-GTX1080TI-11G-GAMING', 'Asus', 749.99, 'STRIX GAMING', 'GeForce GTX 1080 Ti', 11, 1.49),
    ('Asus ROG STRIX-GTX1080-A8G-GAMING', 'Asus', 554.98, 'ROG STRIX', 'GeForce GTX 1080', 8, 1.67);
    
INSERT INTO `psu` (name, manufacturer, price, series, form_factor, watts, efficiency, modular)
VALUES
    ('EVGA SuperNOVA 750', 'EVGA', 107.89, 'SuperNOVA G2', 'ATX', 750, '80+ Gold', 'Full'),
    ('Corsair CX550M', 'Corsair', 59.99, 'CXM', 'ATX', 550, '80+ Bronze', 'Semi'),
    ('EVGA SuperNOVA 650', 'EVGA', 77.99, 'SuperNOVA NEX', 'ATX', 650, '80+ Gold', 'No');
   
INSERT INTO `ram` (name, manufacturer, price, size, module, type, speed)
VALUES
    ('G.Skill NT Series', 'G.Skill', 83.88, 8, '1x8GB', '288-pin DIMM', 'DDR4-2400'),
    ('G.Skill Ripjaws V Series', 'G.Skill', 169.95, 16, '2x8GB', '288-pin DIMM', 'DDR4-2666'),
    ('Corsair Vengeance LPX', 'Corsair', 188.99, 16, '2x8GB', '288-pin DIMM', 'DDR4-3000');
 
INSERT INTO `storage` (name, manufacturer, price, type, form, series, capacity, cache)
VALUES
    ('Western Digital WD10EZEX', 'Western Digital', 41.77, '7200RPM', '3.5"', 'Caviar Blue', '1TB', '64MB'),
    ('Samsung MZ-75E250B/AM', 'Samsung', 94.99, 'SSD', '2.5"', '850 EVO-Series', '250GB', NULL),
    ('Samsung MZ-75E500B/AM', 'Samsung', 149.99, 'SSD', '2.5"', '850 EVO-Series', '500GB', NULL);
    
INSERT INTO `cooler` (name, manufacturer, price, rpm, noise)
VALUES
    ('Cooler Master Hyper 212 EVO', 'Cooler Master', 24.39, '600 - 2000 RPM', '9.0 - 36.0 dbA'),
    ('Corsair H100i v2', 'Corsair', 99.99, '2435 RPM', '37.7 dbA'),
    ('NZXT Kraken X62 Rev 2', 'NZXT', 414.89, '500 - 1800 RPM', '21.0 - 38.0 dbA');
    
INSERT INTO `computer_case` (name, manufacturer, price, type, psu_included)
VALUES
    ('NZXT S340 (White)', 'NZXT', 61.99, 'ATX Mid Tower', NULL),
    ('Rosewill FBM-01', 'Rosewill', 21.99, 'MicroATX Mini Tower', NULL),
    ('EVGA Hadron', 'EVGA', 169.99, 'Mini ITX Tower', 500);

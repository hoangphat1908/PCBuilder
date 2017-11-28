USE `db`;

SET FOREIGN_KEY_CHECKS=0;
truncate `build_ram`;
truncate `build_storage`;
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

INSERT INTO `cpu` (manufacturer, model, price, cores, clock_speed, TDP)
VALUES
    ('Intel', 'Core i7-7700K', 318.34, 4, 4.2, 91),
    ('AMD', 'Ryzen 5 1600', 193.44, 6, 3.2, 65),
    ('Intel', 'Core i7-8700K', 414.89, 6, 3.7, 65);

INSERT INTO `motherboard` (manufacturer, model, price, form_factor, socket, ram_slots, ram_max)
VALUES
    ('MSI', 'Z270-A PRO', 89.88, 'ATX', 'LGA1151', 4, 64),
    ('Asus', 'STRIX Z270-E GAMING', 189.88, 'ATX', 'LGA1151', 4, 64),
    ('MSI', 'B250M PRO-VD', 52.39, 'Micro ATX', 'LGA1151', 2, 32);
    
INSERT INTO `gpu` (manufacturer, model, price, series, chipset, memory, core_clock)
VALUES
    ('MSI', 'GTX 1050 Ti GAMING X 4G', 174.99, 'GAMING X 4G', 'GeForce GTX 1050 Ti', 4, 1.29),
    ('Asus', 'STRIX-GTX1080TI-11G-GAMING', 749.99, 'STRIX GAMING', 'GeForce GTX 1080 Ti', 11, 1.49),
    ('Asus', 'ROG STRIX-GTX1080-A8G-GAMING', 554.98, 'ROG STRIX', 'GeForce GTX 1080', 8, 1.67);
    
INSERT INTO `psu` (manufacturer, model, price, series, form_factor, watts, efficiency, modular)
VALUES
    ('EVGA', 'SuperNOVA 750', 107.89, 'SuperNOVA G2', 'ATX', '750W', '80+ Gold', 'Full'),
    ('Corsair', 'CX550M', 59.99, 'CXM', 'ATX', '550W', '80+ Bronze', 'Semi'),
    ('EVGA', 'SuperNOVA 650', 77.99, 'SuperNOVA NEX', 'ATX', '650W', '80+ Gold', 'No');
   
INSERT INTO `ram` (manufacturer, model, price, size, module, type, speed)
VALUES
    ('G.Skill', 'NT Series', 83.88, 8, '1x8GB', '288-pin DIMM', 'DDR4-2400'),
    ('G.Skill', 'Ripjaws V Series', 169.95, 16, '2x8GB', '288-pin DIMM', 'DDR4-2666'),
    ('Corsair', 'Vengeance LPX', 188.99, 16, '2x8GB', '288-pin DIMM', 'DDR4-3000');
 
INSERT INTO `storage` (manufacturer, model, price, type, form, series, capacity, cache)
VALUES
    ('Western Digital', 'WD10EZEX', 41.77, '7200RPM', '3.5"', 'Caviar Blue', '1TB', '64MB'),
    ('Samsung', 'MZ-75E250B/AM', 94.99, 'SSD', '2.5"', '850 EVO-Series', '250GB', NULL),
    ('Samsung', 'MZ-75E500B/AM', 149.99, 'SSD', '2.5"', '850 EVO-Series', '500GB', NULL);
    
INSERT INTO `cooler` (manufacturer, model, price, rpm, noise)
VALUES
    ('Cooler Master', 'Hyper 212 EVO', 24.39, '600 - 2000 RPM', '9.0 - 36.0 dbA'),
    ('Corsair', 'H100i v2', 99.99, '2435 RPM', '37.7 dbA'),
    ('NZXT', 'Kraken X62 Rev 2', 414.89, '500 - 1800 RPM', '21.0 - 38.0 dbA');
    
INSERT INTO `computer_case` (manufacturer, model, price, type, psu_included)
VALUES
    ('NZXT', 'S340 (White)', 61.99, 'ATX Mid Tower', NULL),
    ('Rosewill', 'FBM-01', 21.99, 'MicroATX Mini Tower', NULL),
    ('EVGA', 'Hadron', 169.99, 'Mini ITX Tower', '500W');

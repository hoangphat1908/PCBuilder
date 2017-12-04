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
    ('Intel', 'Core i7-7700K', 289.99, 4, 4.2, 91),
    ('AMD', 'Ryzen 5 1600', 193.44, 6, 3.2, 65),
    ('Intel', 'Core i7-8700K', 414.89, 6, 3.7, 65),
    ('AMD','FX-6300',79.99,6,3.5,95),
    ('Intel','Core i5-7600K',249.99,4,3.8,91),
    ('AMD','Ryzen 7 1700X',279.99,8,3.4,95),
    ('Intel','Core i3-7100',109.99,2,3.9,51),
    ('AMD','Ryzen 5 1600X',199.99,6,3.6,95),
   	('Intel','Core i5-7500',179.99,4,3.4,65),
   	('AMD','Ryzen 7 1700',269.99,8,3.0,65),
    ('Intel', 'Core i7-7700',304.99,4,3.6,65),
    ('AMD','Ryzen 3 1200',99.99,4,3.1,65),
    ('Intel',' Core i7-7820X',499.99,8,3.6,140),
    ('AMD','Ryzen Threadripper 1950X',799.99,16,3.4,180),
    ('Intel',' Core i7-7800X',309.99,6,3.5,140),
    ('AMD','Ryzen 5 1500X',164.99,4,3.5,65),
	('Intel',' Core i7-6700',325.37,4,3.4,65);
	
INSERT INTO `motherboard` (manufacturer, model, price, form_factor, socket, ram_slots, ram_max)
VALUES
    ('MSI', 'Z270-A PRO', 89.88, 'ATX', 'LGA1151', 4, 64),
    ('Asus', 'STRIX Z270-E GAMING', 189.88, 'ATX', 'LGA1151', 4, 64),
    ('MSI', 'B250M PRO-VD', 52.39, 'Micro ATX', 'LGA1151', 2, 32),
    ('MSI','Z97 PC Mate',187.94,'ATX','LGA 1150',4,32),
    ('MSI','H97 PC Mate',171.97,'ATX','LGA 1150',4,32),
    ('MSI','Z97S SLI Krait Edition',199.99,'ATX','LGA 1150',4,32),
    ('Gigabyte','Z370 AORUS GAMING 7',199.99,'ATX','LGA1151',4,64),
    ('Asus','ROG STRIX B350-F GAMING',129.99,'ATX','AM4',4,64),
    ('ASRock','AB350M Pro4',59.99,'ATX','AM4',4,64),
    ('Gigabyte','GA-AB350-GAMING 3',84.99,'ATX','AM4',4,64),
    ('ASRock','X370 Taichi',184.99,'ATX','AM4',4,64),
    ('Asus','PRIME B350-PLUS',79.99,'ATX','AM4',4,64),
    ('Asus','ROG Maximus X Hero',279.99,'ATX','LGA 1151',4,64),
    ('ASRock','AB350 GAMING-ITX/ac',94.99,'ITX','AM4',4,32),
    ('ASRock','Z270 Extreme 4',134.99,'ATX','LGA 1151',4,64);
    
INSERT INTO `gpu` (manufacturer, model, price, series, chipset, memory, core_clock)
VALUES
    ('MSI', 'GTX 1050 Ti GAMING X 4G', 174.99, 'GAMING X 4G', 'GeForce GTX 1050 Ti', 4, 1.29),
    ('Asus', 'STRIX-GTX1080TI-11G-GAMING', 749.99, 'STRIX GAMING', 'GeForce GTX 1080 Ti', 11, 1.49),
    ('Asus', 'ROG STRIX-GTX1080-A8G-GAMING', 554.98, 'ROG STRIX', 'GeForce GTX 1080', 8, 1.67),
	('MSI', 'GTX 1070 GAMING X 8G', 494.99, 'GAMING X 8G', 'GeForce GTX 1070', 8, 1.51),
    ('MSI', 'GTX 980 Ti GAMING 6G', 469.99, 'GAMING X 6G', 'GeForce GTX 980 Ti', 6, 1.18),
    ('ASUS', 'ROG STRIX-GTX1070-O8G-GAMING', 444.98, 'ROG STRIX', 'GeForce 1070', 8, 1.63),
    ('ASUS', 'STRIX-GTX1080TI-O11G-GAMING', 804.98, 'STRIX GAMING', 'GeForce 1080 Ti', 11, 1.57),
    ('Gigabyte', 'GV-N1080WF3OC-8GD', 499.99, 'WINDFORCE OC8G', 'GeForce GTX 1080', 8, 1.66),
    ('EVGA', '04G-P4-6251-KR', 159.89, 'ACX 2.0', 'GeForce GTX 1050 Ti', 4, 1.29),
    ('EVGA', '11G-P4-6393-KR', 743.99, 'SC Black Edition', 'GeForce GTX 1080 Ti', 11, 1.56);
    
INSERT INTO `psu` (manufacturer, model, price, series, form_factor, watts, efficiency, modular)
VALUES
    ('EVGA', 'SuperNOVA 750', 107.89, 'SuperNOVA G2', 'ATX', '750W', '80+ Gold', 'Full'),
    ('Corsair', 'CX550M', 59.99, 'CXM', 'ATX', '550W', '80+ Bronze', 'Semi'),
    ('EVGA', 'SuperNOVA 650', 77.99, 'SuperNOVA NEX', 'ATX', '650W', '80+ Gold', 'No'),
    ('EVGA', 'SuperNOVA 850', 93.98, 'SuperNOVA G2', 'ATX', '850W', '80+ Gold', 'Full'),
    ('EVGA', '210-GQ-0650-V1', 71.89, '', 'ATX', '650W', '80+ Gold', 'Semi'),
    ('EVGA', 'SuperNOVA 550', 74.89, 'SuperNOVA G2', 'ATX', '550W', '80+ Gold', 'Full'),
    ('Corsair', 'AX760', 159.88, '', 'ATX', '760W', '80+ Platinum', 'Full'),
    ('Corsair', 'AX1200i', 299.99, '', 'ATX', '1200W', '80+ Platinum', 'Full'),
    ('Corsair', 'AX750', 199.99, 'Professional Gold', 'ATX', '750W', '80+ Gold', 'Full'),
    ('Corsair', 'AX860', 155.98, '', 'ATX', '860W', '80+ Platinum', 'Full');
   
INSERT INTO `ram` (manufacturer, model, price, size, module, type, speed)
VALUES
    ('G.Skill', 'NT Series', 83.88, 8, '1x8GB', '288-pin DIMM', 'DDR4-2400'),
    ('G.Skill', 'Ripjaws V Series', 169.95, 16, '2x8GB', '288-pin DIMM', 'DDR4-2666'),
    ('Corsair', 'Vengeance LPX', 188.99, 16, '2x8GB', '288-pin DIMM', 'DDR4-3000'),
    ('G.Skill', 'Ripjaws Series', 74.49, 8, '2x4GB', '240-pin DIMM', 'DDR3-1600'),
    ('Kingston', 'HyperX Fury Black', 117.94, 8, '1x8GB', '288-pin DIMM', 'DDR4-2133'),
    ('Kingston', 'HyperX Fury Black', 143.04, 16, '2x8GB', '240-pin DIMM', 'DDR3-1866'),
    ('Corsair', 'Vengeance LPX', 94.00, 8, '1x8GB', '288-pin DIMM', 'DDR4-2400'),
    ('Kingston', 'HyperX Fury Black', 109.99, 8, '2x4GB', '288-pin DIMM', 'DDR4-2133'),
    ('Kingston', 'HyperX Fury Black', 213.78, 16, '2x8GB', '288-pin DIMM', 'DDR4-2133'),
    ('G.Skill', 'Ripjaws X Series', 68.99, 8, '2x4GB', '240-pin DIMM', 'DDR3-1600');
 
INSERT INTO `storage` (manufacturer, model, price, type, form, series, capacity, cache)
VALUES
    ('Western Digital', 'WD10EZEX', 41.77, '7200RPM', '3.5"', 'Caviar Blue', '1TB', '64MB'),
    ('Samsung', 'MZ-75E250B/AM', 94.99, 'SSD', '2.5"', '850 EVO-Series', '250GB', NULL),
    ('Samsung', 'MZ-75E500B/AM', 149.99, 'SSD', '2.5"', '850 EVO-Series', '500GB', NULL),
    ('Seagate', 'ST2000DM006', 66.88, '7200RPM', '3.5"', 'Barracuda', '2TB', NULL),
    ('Samsung', 'MZ-7TE120BW', 169.99, 'SSD', '2.5"', '840 EVO-Series', '120GB', NULL),
	('Samsung', 'MZ-V6E250', 127.89, 'SSD', 'M.2-2280', '960 EVO-Series', '250GB', '512MB'),
    ('Crucial', 'CT512MX100SSD1', 299.99, 'SSD', '2.5"', 'MX100', '512GB', NULL),
    ('Samsung', 'MZ-75E1T0B/AM', 279.99, 'SSD', '2.5"', '850 EVO-Series', '1TB', NULL),
    ('Samsung', 'MZ-7PD128BW', 279.99, 'SSD', '2.5"', '840 Pro Series', '128GB', NULL),
    ('PNY', 'SSD7CS1311-240-RB', 97.49, 'SSD', '2.5"', 'CS1311', '240GB', NULL);
    
INSERT INTO `cooler` (manufacturer, model, price, rpm, noise)
VALUES
    ('Cooler Master', 'Hyper 212 EVO', 24.39, '600 - 2000 RPM', '9.0 - 36.0 dbA'),
    ('Corsair', 'H100i v2', 99.99, '2435 RPM', '37.7 dbA'),
    ('NZXT', 'Kraken X62 Rev 2', 414.89, '500 - 1800 RPM', '21.0 - 38.0 dbA'),
    ('Noctua', 'NH-D15', 88.88, '300 - 1500 RPM', '19.2 - 24.6 dbA'),
    ('Noctua', 'NH-U9S', 58.35, '400 - 2000 RPM', '16.3 - 22.8 dbA'),
    ('CRYORIG', 'H7', 28.9, '330 - 1600 RPM', '1.0 - 25.0 dbA'),
    ('CRYORIG', 'M9i', 18.99, '600 - 2200 RPM', '26.4 dbA'),
    ('be quiet!', 'Pure Rock Slim', 21.49, '2000 RPM', '13.1 - 25 dbA'),
    ('Corsair', 'H105', 89.99, '800 - 2700 RPM', '37.7 dbA'),
    ('be quiet!', 'Dark Rock Pro 3', 74.49, '1400 - 1700 RPM', '13.2 - 26.1 dbA');
    
INSERT INTO `computer_case` (manufacturer, model, price, type, psu_included)
VALUES
    ('NZXT', 'S340 (White)', 61.99, 'ATX Mid Tower', NULL),
    ('Rosewill', 'FBM-01', 21.99, 'MicroATX Mini Tower', NULL),
    ('EVGA', 'Hadron', 169.99, 'Mini ITX Tower', '500W'),
    ('Raidmax', 'Vortex', 35.98, 'ATX Mid Tower', NULL),
    ('Corsair', 'Crystal 570X RGB', 139.98, 'ATX Mid Tower', NULL),
    ('Deepcool', 'TESSERACT SW', 36.99, 'ATX Mid Tower', NULL),
    ('Thermaltake', 'Core V21', 34.99, 'ATX Mid Tower', NULL),
    ('Cooler Master', 'MasterBox Lite 5 RGB', 76.98, 'ATX Mid Tower', NULL),
    ('Fractal Design', 'Node 202', 129.99, 'HTPC', '450W'),
    ('NZXT', 'S340 (Black/Blue)', 49.99, 'ATX Mid Tower', NULL);

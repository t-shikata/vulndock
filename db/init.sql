USE company;

-- =========================
-- Employees table
-- Public internal information
-- =========================
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  department VARCHAR(50) NOT NULL,
  position VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  extension VARCHAR(10) NOT NULL
);

-- =========================
-- Users table
-- Initial users & passwords
-- (intentionally plaintext)
-- =========================
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT NOT NULL,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(100) NOT NULL
);

-- =========================
-- Initial data: employees
-- =========================
INSERT INTO employees VALUES
(1001,'Taro Sato','General Affairs','Senior Staff','taro.sato@company.local','1001'),
(1002,'Hanako Suzuki','Human Resources','Manager','hanako.suzuki@company.local','1002'),
(1003,'Ken Takahashi','Accounting','Staff','ken.takahashi@company.local','1003'),
(1004,'Misaki Tanaka','Sales','Senior Staff','misaki.tanaka@company.local','2001'),
(1005,'Sho Ito','Sales','Manager','sho.ito@company.local','2002'),
(1006,'Yu Watanabe','IT','Engineer','yu.watanabe@company.local','3001'),
(1007,'Riku Yamamoto','IT','Senior Engineer','riku.yamamoto@company.local','3002'),
(1008,'Aya Nakamura','Public Relations','Staff','aya.nakamura@company.local','4001'),
(1009,'Daisuke Kobayashi','Development','Engineer','daisuke.kobayashi@company.local','5001'),
(1010,'Mayu Kato','Development','Team Lead','mayu.kato@company.local','5002'),
(1011,'Koichi Yoshida','Legal','Staff','koichi.yoshida@company.local','6001'),
(1012,'Naoki Yamada','Sales','Staff','naoki.yamada@company.local','2003'),
(1013,'Miyu Sasaki','Human Resources','Staff','miyu.sasaki@company.local','1004'),
(1014,'Tsuyoshi Matsumoto','Executive','Board Member','tsuyoshi.matsumoto@company.local','9001'),
(1015,'Satoshi Inoue','IT','Administrator','satoshi.inoue@company.local','3000');

-- =========================
-- Initial data: users
-- =========================
INSERT INTO users (emp_id, username, password) VALUES
(1001,'sato.t','Welcome123'),
(1002,'suzuki.h','InitPass!'),
(1003,'takahashi.k','Password01'),
(1004,'tanaka.m','Sales2020'),
(1005,'ito.s','Manager@123'),
(1006,'watanabe.y','DevStart'),
(1007,'yamamoto.r','RikuIT'),
(1008,'nakamura.a','Public01'),
(1009,'kobayashi.d','CodeCode'),
(1010,'kato.m','DevLead'),
(1011,'yoshida.k','LegalPwd'),
(1012,'yamada.n','market'),
(1013,'sasaki.m','HRinit'),
(1014,'matsumoto.t','BoardOnly'),
(1015,'inoue.s','AdminInit');


-- =========================
-- log data
-- =========================
CREATE TABLE posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
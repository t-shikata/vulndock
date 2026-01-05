import mysql from "mysql2/promise";

export const db = mysql.createPool({
  host: "172.20.30.42",
  user: "root",
  password: "rootpass",
  database: "company",
});
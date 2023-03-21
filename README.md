# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 3.1.3p185 (2022-11-24 revision 1a6b16756e) [x86_64-darwin22]
  Rails 6.1.7.3
* System dependencies

* Configuration

* Database creation
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | bigint       | NO   | PRI | NULL    | auto_increment |
| title       | varchar(255) | NO   |     | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| due_date    | date         | YES  |     | NULL    |                |
| completed   | tinyint(1)   | YES  |     | 0       |                |
| created_at  | datetime(6)  | NO   |     | NULL    |                |
| updated_at  | datetime(6)  | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

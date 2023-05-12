CREATE DATABASE spring;

create user 'spring'@'localhost' identified by 'spring';

grant all privileges on spring.* to 'spring'@'localhost';
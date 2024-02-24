-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "employees" (
    "employee_id" INT   NOT NULL,
    "title_id" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_id"
     )
);

-- This layout assumes that an employee can
-- only have one title at a time and when roles
-- change, the table with be overwritten
CREATE TABLE "titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "department" (
    "department_id" VARCHAR(10)   NOT NULL,
    "department_n" VARCHAR   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "department_id"
     )
);

CREATE TABLE "dept_employees" (
    "employee_id" INT   NOT NULL,
    "department_id" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_dept_employees" PRIMARY KEY (
        "employee_id","department_id"
     )
);

-- This layout assumes that each manager
-- manages one dept at a time
CREATE TABLE "dept_managers" (
    "manager_id" INT   NOT NULL,
    "department_id" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_dept_managers" PRIMARY KEY (
        "manager_id"
     )
);

-- This layout assumes that as each employee's salary
-- changes, the salary is overwritten to update
CREATE TABLE "emp_salaries" (
    "employee_id" VARCHAR(10)   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_emp_salaries" PRIMARY KEY (
        "employee_id"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_department_id" FOREIGN KEY("department_id")
REFERENCES "department" ("department_id");


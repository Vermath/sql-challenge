-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "dept_emp" (
    "emp_no" varchar(50)   NOT NULL,
    "dept_no" varchar(8)   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" varchar(50)   NOT NULL,
    "emp_title" varchar(50) NOT NULL, 
	"birth_date" date NOT NULL,
    "first_name" varchar(35)   NOT NULL,
    "last_name" varchar(35)   NOT NULL,
    "gender" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" varchar(50)   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" varchar(50)   NOT NULL,
    "title" varchar(20)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(8)   NOT NULL,
    "emp_no" varchar(50)   NOT NULL
);

CREATE TABLE "departments" (
    "dept_no" varchar(50)   NOT NULL,
    "dept_name" varchar(40)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


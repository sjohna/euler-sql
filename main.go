package main

import (
	"database/sql"
	"fmt"
	"github.com/golang-migrate/migrate/v4"
	"github.com/golang-migrate/migrate/v4/database/postgres"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	_ "github.com/lib/pq"
)

func main() {
	db, err := sql.Open("postgres", "postgres://euler:euler@localhost:5432/euler?sslmode=disable")
	if err != nil {
		fmt.Println("Error opening connection to database: ", err)
		return
	}

	driver, err := postgres.WithInstance(db, &postgres.Config{})
	if err != nil {
		fmt.Println("Error creating driver: ", err)
		return
	}

	m, err := migrate.NewWithDatabaseInstance("file://migrations", "euler", driver)
	if err != nil {
		fmt.Println("Error creating migration: ", err)
		return
	}

	err = m.Up()
	if err != nil && err != migrate.ErrNoChange {
		fmt.Println("Error running migration: ", err)
		return
	}

	// language=SQL
	SQL := `select problem_number, answer from solution order by problem_number asc`

	rows, err := db.Query(SQL)
	if err != nil {
		fmt.Println("Error querying database: ", err)
		return
	}

	for rows.Next() {
		var problemNumber int64
		var solution string
		err = rows.Scan(&problemNumber, &solution)
		if err != nil {
			fmt.Println("Error scanning row: ", err)
			return
		}
		fmt.Printf("%d: %s\n", problemNumber, solution)
	}
}

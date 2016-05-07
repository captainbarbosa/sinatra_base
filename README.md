Modifies an existing API to work with Sinatra, providing HTTP responses.
Created as an assignment while at The Iron Yard.

The data represents multiple employees belonging to a department housed a SQLite database.

Currently only runs in the test suite.

Tests confirm the following HTTP requests work:      

* `GET` a list of employees
* `GET` a specific employee
* `POST` a new employee
* `DELETE` a specific employee
* `PATCH` (update) the name of an employee.

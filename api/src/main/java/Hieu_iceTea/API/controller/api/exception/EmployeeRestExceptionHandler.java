package Hieu_iceTea.API.controller.api.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class EmployeeRestExceptionHandler {

    //Add an exception handler for EmployeeNotFoundException
    @ExceptionHandler
    public ResponseEntity<EmployeeErrorResponse> handlerException(EmployeeNotFoundException employeeNotFoundException) {

        //Create EmployeeErrorResponse
        EmployeeErrorResponse employeeErrorResponse = new EmployeeErrorResponse(
                HttpStatus.NOT_FOUND.value(),
                employeeNotFoundException.getMessage(),
                System.currentTimeMillis()
        );

        // return ResponseEntity
        return new ResponseEntity<>(employeeErrorResponse, HttpStatus.NOT_FOUND);

    }

    // Add another exception handler ... to catch any exception (catch all)
    @ExceptionHandler
    public ResponseEntity<EmployeeErrorResponse> handlerException(Exception exception) {

        //Create EmployeeErrorResponse
        EmployeeErrorResponse employeeErrorResponse = new EmployeeErrorResponse(
                HttpStatus.BAD_REQUEST.value(),
                exception.getMessage(),
                System.currentTimeMillis()
        );

        // return ResponseEntity
        return new ResponseEntity<>(employeeErrorResponse, HttpStatus.BAD_REQUEST);

    }

}

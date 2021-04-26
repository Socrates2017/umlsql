package com.zrzhen.umlsql.uml2ddl;

/**
 * @author chenanlian
 */
public class FileEmptyException extends Exception {
    private final String message;

    public FileEmptyException(String message) {
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }
}

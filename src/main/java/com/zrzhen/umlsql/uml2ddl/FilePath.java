package com.zrzhen.umlsql.uml2ddl;

public class FilePath {
    String path;
    String name;
    String postfix;

    public FilePath() {
    }

    public FilePath(String path, String name, String postfix) {
        this.path = path;
        this.name = name;
        this.postfix = postfix;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPostfix() {
        return postfix;
    }

    public void setPostfix(String postfix) {
        this.postfix = postfix;
    }
}

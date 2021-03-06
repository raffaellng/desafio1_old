package com.example.desafio1.exception;

import lombok.Getter;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

public class ApiErrosExceptions {

    @Getter
    private List<String> errors;

    public ApiErrosExceptions(String mensagemErros){
        this.errors = Arrays.asList(mensagemErros);
    }
}

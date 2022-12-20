package com.emirozturk.benzerbul.Model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data

public class Response<E>{
    Boolean isSuccess;
    String message;
    E body;
    private Response(Boolean isSuccess,String message,E body){
        this.isSuccess = isSuccess;
        this.message = message;
        this.body = body;
    }
    public static<E> Response Success(E body){
        return new Response<E>(true,null,body);
    }
    public static<E> Response Fail(String message){
        return new Response<E>(false,message,null);
    }
}

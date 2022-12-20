package com.emirozturk.benzerbul.REST;

import com.emirozturk.benzerbul.Model.Response;
import com.emirozturk.benzerbul.Model.User;
import com.emirozturk.benzerbul.Service.IUserService;
import com.emirozturk.benzerbul.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/api/User")
public class UserRESTController {
    IUserService userService;
    UserRESTController(IUserService userService){
        this.userService = userService;
    }
    @GetMapping("/")
    ResponseEntity<Response<List<User>>> getUsers(){
        var response = userService.getUsers();
        if(response.getIsSuccess())
            return  ResponseEntity.ok(response);
        else
            return ResponseEntity.badRequest().body(response);
    }
    @PostMapping("/Login/")
    ResponseEntity<Response<User>> login(@RequestBody User user){
        var response = userService.login(user.getUsername(),user.getPassword());
        if(response.getIsSuccess())
            return  ResponseEntity.ok(response);
        else
            return ResponseEntity.badRequest().body(response);
    }

    @PostMapping("/")
    ResponseEntity<Response<User>> addUser(@RequestBody User user){
        var response = userService.addUser(user);
        if(response.getIsSuccess())
            return  ResponseEntity.ok(response);
        else
            return ResponseEntity.badRequest().body(response);
    }
    @PostMapping("/{username}/AddMusic/{id}")
    ResponseEntity<Response<User>> addUser(@PathVariable String username,@PathVariable int id){
        Response<User> response = userService.addMusicToUser(username,id);
        if(response.getIsSuccess())
            return  ResponseEntity.ok(response);
        else
            return ResponseEntity.badRequest().body(response);
    }
    @DeleteMapping("/{username}")
    ResponseEntity<Response<User>> removeUser(@PathVariable String username){
        var response = userService.removeUser(username);
        if(response.getIsSuccess())
            return  ResponseEntity.ok(response);
        else
            return ResponseEntity.badRequest().body(response);
    }
    @PutMapping("/{id}")
    ResponseEntity<Response<User>> updateUser(@PathVariable int id,@RequestBody User user){
        var response = userService.updateUser(id,user);
        if(response.getIsSuccess())
            return  ResponseEntity.ok(response);
        else
            return ResponseEntity.badRequest().body(response);
    }

}

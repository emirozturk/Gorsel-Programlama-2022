package com.emirozturk.benzerbul.Service;

import com.emirozturk.benzerbul.DataAccess.IMusicRepository;
import com.emirozturk.benzerbul.DataAccess.IUserRepository;
import com.emirozturk.benzerbul.Model.User;
import com.emirozturk.benzerbul.Model.Music;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.stereotype.Service;
import com.emirozturk.benzerbul.Model.Response;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@Service
public class UserService implements IUserService {
    IUserRepository userRepository;
    IMusicRepository musicRepository;

    public UserService(IUserRepository userRepository,IMusicRepository musicRepository) {
        this.userRepository = userRepository;this.musicRepository= musicRepository;
    }

    @Override
    public Response<List<User>> getUsers() {
        List<User> users = userRepository.findAll();
        return Response.Success(users);
    }

    @Override
    public Response<User> login(String username, String password) {
        User user = userRepository.findAll().stream().filter(x-> Objects.equals(x.getUsername(), username) && Objects.equals(x.getPassword(), password)).findFirst().orElse(null);
        if(user == null)return Response.Fail("User not found");
        return Response.Success(user);
    }

    @Override
    public Response<User> addUser(User user) {
        try{
            User found = userRepository.findAll()
                    .stream()
                    .filter(x->x.getUsername() == user.getUsername() &&
                            x.getPassword() == user.getPassword())
                    .findFirst().orElse(null);

            if(found != null)return Response.Fail("User exists");
            User response = userRepository.save(user);
            return Response.Success(response);
        }catch (Exception ex){
            return Response.Fail(ex.getMessage());
        }
    }

    @Override
    public Response<User> removeUser(String username) {
        try{
            User result = userRepository.findAll().stream().filter(x->x.getUsername().equals(username)).findFirst().orElse(null);
            if(result==null)return Response.Fail("User does not exist");
            userRepository.delete(result);
            return Response.Success(result);
        }catch (Exception ex){
            return Response.Fail(ex.getMessage());
        }
    }

    @Override
    public Response<User> updateUser(int id, User user) {
        try{
            User result = userRepository.findAll().stream().filter(x-> x.getId()==id).findFirst().orElse(null);
            if(result==null)return Response.Fail("User does not exist");
            result.setMusics(user.getMusics());
            userRepository.save(result);
            return Response.Success(result);
        }catch (Exception ex){
            return Response.Fail(ex.getMessage());
        }
    }

    @Override
    public Response<User> addMusicToUser(String username, int id) {
        try{
            User result = userRepository.findAll().stream().filter(x-> x.getUsername().equals(username)).findFirst().orElse(null);
            if(result==null)return Response.Fail("User does not exist");
            Music musicResult = musicRepository.findById(id).orElse(null);
            if(musicResult==null)return Response.Fail("Music does not exist");
            result.getMusics().add(musicResult);
            userRepository.save(result);
            return Response.Success(result);
        }catch (Exception ex){
            return Response.Fail(ex.getMessage());
        }
    }
}

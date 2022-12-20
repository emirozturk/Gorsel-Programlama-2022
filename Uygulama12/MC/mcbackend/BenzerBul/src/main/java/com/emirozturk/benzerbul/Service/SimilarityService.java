package com.emirozturk.benzerbul.Service;

import com.emirozturk.benzerbul.DataAccess.IUserRepository;
import com.emirozturk.benzerbul.Model.Response;
import com.emirozturk.benzerbul.Model.User;
import com.emirozturk.benzerbul.Model.UserSimilarity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SimilarityService implements  ISimilarityService{
    IUserRepository userRepository;

    public SimilarityService(IUserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public Response<List<UserSimilarity>> getSimilar(int id) {
        try {
            var users = userRepository.findAll();
            var user = users.stream().filter(x-> x.getId() == id).findFirst().orElse(null);
            var outputList = new ArrayList<UserSimilarity>();
            for(var u :users){
                if(!u.getUsername().equals(user.getUsername())){
                    double score = Calculate(user,u);
                    outputList.add(new UserSimilarity(u,score));
                }
            }
            return Response.Success(outputList);
        }catch (Exception ex){
            return Response.Fail(ex.getMessage());
        }
    }

    private double Calculate(User user1, User user2) {
        var m1 = user1.getMusics();
        var m2 = user2.getMusics();
        var counter = 0;
        for(var m:m1){
            var result = m2.stream().anyMatch(x-> x.getId()==m.getId());
            if(result)
                counter++;
        }
        return ((float)counter)/m1.size();
    }
}

package com.emirozturk.benzerbul.Service;

import com.emirozturk.benzerbul.Model.Response;
import com.emirozturk.benzerbul.Model.User;
import com.emirozturk.benzerbul.Model.UserSimilarity;

import java.util.List;

public interface ISimilarityService {
    Response<List<UserSimilarity>> getSimilar(int id);
}

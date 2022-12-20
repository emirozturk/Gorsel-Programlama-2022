package com.emirozturk.benzerbul.Model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserSimilarity {
    User user;
    double score;

}

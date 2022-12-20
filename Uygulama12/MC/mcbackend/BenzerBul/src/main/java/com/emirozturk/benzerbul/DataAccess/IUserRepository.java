package com.emirozturk.benzerbul.DataAccess;

import com.emirozturk.benzerbul.Model.Music;
import com.emirozturk.benzerbul.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IUserRepository extends JpaRepository<User,Integer>{
}

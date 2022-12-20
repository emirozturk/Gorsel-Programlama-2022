package com.emirozturk.benzerbul.DataAccess;

import com.emirozturk.benzerbul.Model.Music;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IMusicRepository extends JpaRepository<Music,Integer> {
}

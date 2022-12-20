package com.emirozturk.benzerbul.Service;

import com.emirozturk.benzerbul.Model.Music;
import com.emirozturk.benzerbul.Model.Response;

public interface IMusicService {
    Response<Music> addMusic(Music music);

    Response<Music> deleteMusic(int id);
}

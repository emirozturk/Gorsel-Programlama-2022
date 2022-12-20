package com.emirozturk.benzerbul.Service;

import com.emirozturk.benzerbul.DataAccess.IMusicRepository;
import com.emirozturk.benzerbul.Model.Music;
import com.emirozturk.benzerbul.Model.Response;
import org.springframework.stereotype.Service;

@Service
public class MusicService implements IMusicService{
    IMusicRepository musicRepository;

    public MusicService(IMusicRepository musicRepository) {
        this.musicRepository = musicRepository;
    }

    @Override
    public Response<Music> addMusic(Music music) {
        try{
            var result = musicRepository.findAll().stream().filter(x->x.getName()==music.getName()).findFirst().orElse(null);
            if(result != null)return Response.Fail("Music Exists");
            musicRepository.save(music);
            return Response.Success(music);
        }catch (Exception ex){
            return Response.Fail(ex.getMessage());
        }
    }

    @Override
    public Response<Music> deleteMusic(int id) {
        try{
            var result = musicRepository.findById(id).orElse(null);
            if(result == null)return Response.Fail("Music not found");
            musicRepository.delete(result);
            return Response.Success(result);
        }catch (Exception ex){
            return Response.Fail(ex.getMessage());
        }
    }
}

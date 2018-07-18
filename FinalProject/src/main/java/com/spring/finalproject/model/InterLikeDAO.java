package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

public interface InterLikeDAO {

	int likecnt(HashMap<String, String> map);

	int checklike(HashMap<String, String> map);

	int addlike(HashMap<String, String> map);
	
}

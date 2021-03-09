package icia.kotlin.mapper;

import java.util.ArrayList;

import com.google.gson.JsonElement;

import icia.kotlin.beans.Movie;
import icia.kotlin.beans.Seat;

public interface ReservationIf {
	public ArrayList<Movie> getMovieList(Movie mv);

	public ArrayList<Movie> getScreeningInfo(Movie mv);

	public ArrayList<Seat> getSeat(Movie mv);
}
